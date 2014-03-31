package by.bsuir.animation
{
	import by.bsuir.animation.entity.AnimateAtom;
	import by.bsuir.animation.entity.AnimateCorpuscule;
	import by.bsuir.animation.entity.AnimateNeitrino;
	import by.bsuir.entity.Neitrino;
	import by.bsuir.helper.PropertiesHelper;
	import by.bsuir.helper.AtomsCreator;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author igor
	 */
	public class Physics
	{
		
		private var canvas:DisplayObjectContainer;
		private var maxX:Number;
		private var minX:Number;
		private var maxY:Number;
		private var minY:Number;
		private var corpusculesArray:Array = [];
		
		public function Physics(_canvas:DisplayObjectContainer)
		{
			this.canvas = _canvas;
			setBoundries(canvas);
		}
		
		public function enable():void
		{
			canvas.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		public function setBoundries(container:DisplayObjectContainer):void
		{
			minX = 0;
			minY = 0;
			maxX = container.width;
			maxY = container.height;
		}
		
		public function createCorpuscules():void
		{
			for (var i:int = 0; i < PropertiesHelper.DEFAULT_NUMBER_OF_CORPUSCULES; i++)
			{
				createAtom(AtomsCreator.U_235);
				createNeitrino();
			}
		}
		
		public function createAtom(type:String):void
		{
			var atom:AnimateAtom;
			atom = new AnimateAtom(AtomsCreator.createElement(type), Math.random() * 10, Math.random() * 10, Math.random() * 30, 20);
			canvas.addChild(atom);
			corpusculesArray.push((atom as AnimateCorpuscule));
		}
		
		public function createNeitrino():void
		{
			var neitrino:AnimateNeitrino;
			neitrino = new AnimateNeitrino(new Neitrino(), Math.random() * 10, Math.random() * 20, Math.random() * 50, 3);
			canvas.addChild(neitrino);
			corpusculesArray.push((neitrino as AnimateCorpuscule));
		}
		
		private function onEnterFrame(e:Event):void
		{
			update();
		}
		
		public function update():void
		{
			// define common vars
			var tempAtom:AnimateCorpuscule;
			var i:int;
			var tempNeitrino:AnimateCorpuscule;
			var k:int;
			
			// loop thru balls array
			for (i = 0; i < corpusculesArray.length; i++)
			{
				// save a reference to ball
				tempAtom = corpusculesArray[i] as AnimateCorpuscule;
				
				// check for collision with other balls
				for (k = 0; k < corpusculesArray.length; k++)
				{
					// save a reference to ball 2
					tempNeitrino = corpusculesArray[k] as AnimateCorpuscule;
					
					// make sure we dont test for collision against itself
					if (tempAtom == tempNeitrino)	continue;
					
					// check if balls are colliding by checking the distance between them
					if (hitTestCircle(tempAtom, tempNeitrino))
					{
						// calculate collision reaction
						collideCorpuscules(tempAtom, tempNeitrino);
						
						// if balls are still touching after collision reaction,
						// try to move them apart
						if (hitTestCircle(tempAtom, tempNeitrino))
						{
							tempAtom.x += tempAtom.velocity.x;
							tempAtom.y += tempAtom.velocity.y;
							tempNeitrino.x -= tempAtom.velocity.x
							tempNeitrino.y -= tempAtom.velocity.y
						}
					}
				}
				
				// Bounce off walls
				// Check if we hit top
				if (((tempAtom.x - tempAtom.radius) < minX) && (tempAtom.velocity.x < 0))
				{
					// reverse velocity
					tempAtom.velocity.x = -tempAtom.velocity.x;
				}
				// Check if we hit bottom
				else if ((tempAtom.x + tempAtom.radius) > maxX && (tempAtom.velocity.x > 0))
				{
					// reverse velocity
					tempAtom.velocity.x = -tempAtom.velocity.x;
				}
				// Check if we hit left side
				if (((tempAtom.y - tempAtom.radius) < minY) && (tempAtom.velocity.y < 0))
				{
					// reverse velocity
					tempAtom.velocity.y = -tempAtom.velocity.y;
				}
				// Check if we hit right side
				else if (((tempAtom.y + tempAtom.radius) > maxY) && (tempAtom.velocity.y > 0))
				{
					// reverse velocity
					tempAtom.velocity.y = -tempAtom.velocity.y;
				}
				
				
				// apply friction to ball velocity
				//tempAtom.velocityX *= _friction;
				//tempAtom.velocityY *= _friction;
				
				// update position based on velocity
				tempAtom.x += tempAtom.velocity.x;
				tempAtom.y += tempAtom.velocity.y;
			}
		}
		
		private function collideCorpuscules(atom:AnimateCorpuscule, neitrino:AnimateCorpuscule):void
		{
			// calculate the distance between center of balls with the Pytagorean theorem
			var dx:Number = atom.x - neitrino.x;
			var dy:Number = atom.y - neitrino.y;
			
			// calculate the angle of the collision in radians
			var collisionAngle:Number = Math.atan2(dy, dx);
			
			// calculate the velocity vector for each ball
			// using existing ball X & Y velocities
			var speed1:Number = Math.sqrt(atom.velocity.x * atom.velocity.x + atom.velocity.y * atom.velocity.y)
			var speed2:Number = Math.sqrt(neitrino.velocity.x * neitrino.velocity.x + neitrino.velocity.y * neitrino.velocity.y)
			
			// calculate the angle in radians for each ball using it's current velocities
			// Calculate the angle formed by vector velocity of each ball, knowing your direction.
			var direction1:Number = Math.atan2(atom.velocity.y, atom.velocity.x);
			var direction2:Number = Math.atan2(neitrino.velocity.y, neitrino.velocity.x);
			
			// rotate the vectors counterclockwise so we can
			// calculate the conservation of momentum next
			var velocityX1:Number = speed1 * Math.cos(direction1 - collisionAngle);
			var velocityY1:Number = speed1 * Math.sin(direction1 - collisionAngle);
			var velocityX2:Number = speed2 * Math.cos(direction2 - collisionAngle);
			var velocityY2:Number = speed2 * Math.sin(direction2 - collisionAngle);
			
			// take the mass of each ball and update their velocities based
			// on the law of conservation of momentum
			var finalVelocityX1:Number = ((atom.mass - neitrino.mass) * velocityX1 + (neitrino.mass + neitrino.mass) * velocityX2) / (atom.mass + neitrino.mass);
			var finalVelocityX2:Number = ((atom.mass + atom.mass) * velocityX1 + (neitrino.mass - atom.mass) * velocityX2) / (atom.mass + neitrino.mass);
			
			// Y velocities stay constant
			// because this is an 1D environment collision
			var finalVelocityY1:Number = velocityY1;
			var finalVelocityY2:Number = velocityY2;
			
			// after we have our final velocities, we rotate the angles back
			// so that the collision angle is preserved
			atom.velocity.x = Math.cos(collisionAngle) * finalVelocityX1 + Math.cos(collisionAngle + Math.PI / 2) * finalVelocityY1;
			atom.velocity.y = Math.sin(collisionAngle) * finalVelocityX1 + Math.sin(collisionAngle + Math.PI / 2) * finalVelocityY1;
			neitrino.velocity.x = Math.cos(collisionAngle) * finalVelocityX2 + Math.cos(collisionAngle + Math.PI / 2) * finalVelocityY2;
			neitrino.velocity.y = Math.sin(collisionAngle) * finalVelocityX2 + Math.sin(collisionAngle + Math.PI / 2) * finalVelocityY2;
			
			// add velocity to ball positions
			atom.x += atom.velocity.x;
			atom.y += atom.velocity.y;
			neitrino.x += neitrino.velocity.x;
			neitrino.y += neitrino.velocity.y;
		}
		
		private function hitTestCircle(atom:AnimateCorpuscule, neitrino:AnimateCorpuscule):Boolean
		{
			var retval:Boolean = false;
			
			var distance:Number = getDistance(atom.x - neitrino.x, atom.y - neitrino.y);
			
			if (distance <= (atom.radius + neitrino.radius))
			{
				retval = true;
			}
			return retval;
		}
		
		public function getDistance(delta_x:Number, delta_y:Number):Number
		{
			return Math.sqrt((delta_x * delta_x) + (delta_y * delta_y));
		}
	
	}

}