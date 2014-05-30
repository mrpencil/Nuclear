package by.bsuir.animation
{
	import by.bsuir.animation.entity.AnimateAtom;
	import by.bsuir.animation.entity.AnimateCorpuscule;
	import by.bsuir.animation.entity.AnimateNeitrino;
	import by.bsuir.entity.Neitrino;
	import by.bsuir.helper.PropertiesHelper;
	import by.bsuir.helper.AtomsCreator;
	import by.bsuir.user_interface.UserInterface;
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
		private var atomsArray:Array = [];
		private var neitrinosArray:Array = [];
		
		public function Physics(_canvas:DisplayObjectContainer)
		{
			this.canvas = _canvas;
			UserInterface.createUserInterface(_canvas);
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
			atom = new AnimateAtom(AtomsCreator.createElement(type), Math.random() * 10, Math.random() * 10, Math.random() * 30, 15);
			canvas.addChild(atom);
			atomsArray.push(atom as AnimateCorpuscule);
		}
		
		public function createNeitrino():void
		{
			var neitrino:AnimateNeitrino;
			neitrino = new AnimateNeitrino(new Neitrino(), Math.random() * 10, Math.random() * 20, Math.random() * 50, 4);
			canvas.addChild(neitrino);
			neitrinosArray.push(neitrino as AnimateCorpuscule);
		}
		
		private function onEnterFrame(e:Event):void
		{
			update();
		}
		
		public function update():void
		{
			// define common vars
			var tempAtom:AnimateCorpuscule;
			var tempAtom1:AnimateCorpuscule;
			var i:int;
			var k:int;
			
			checkCorpusculeCollisions(atomsArray, neitrinosArray);
			checkCorpusculeCollisions(atomsArray, atomsArray);
			checkCorpusculeCollisions(neitrinosArray, neitrinosArray);
		}
		
		private function checkCorpusculeCollisions(array1:Array, array2:Array):void
		{
			var i:int;
			var k:int;
			var tempCorpuscule1:AnimateCorpuscule;
			var tempCorpuscule2:AnimateCorpuscule;
			
			for (i = 0; i < array1.length; i++)
			{
				// save a reference to ball
				tempCorpuscule1 = array1[i] as AnimateCorpuscule;
				
				// check for collision with other balls
				for (k = 0; k < array2.length; k++)
				{
					// save a reference to ball 2
					tempCorpuscule2 = array2[k] as AnimateCorpuscule;
					
					// check if balls are colliding by checking the distance between them
					if (hitTestCircle(tempCorpuscule1, tempCorpuscule2))
					{
						// calculate collision reaction
						collideCorpuscules(tempCorpuscule1, tempCorpuscule2);
						
						// if balls are still touching after collision reaction,
						// try to move them apart
						if (hitTestCircle(tempCorpuscule1, tempCorpuscule2))
						{
							tempCorpuscule1.x += tempCorpuscule1.velocity.x;
							tempCorpuscule1.y += tempCorpuscule1.velocity.y;
							tempCorpuscule2.x -= tempCorpuscule1.velocity.x
							tempCorpuscule2.y -= tempCorpuscule1.velocity.y
						}
					}
				}
				
				// Bounce off walls
				// Check if we hit top
				if (((tempCorpuscule1.x - tempCorpuscule1.radius) < minX) && (tempCorpuscule1.velocity.x < 0))
				{
					// reverse velocity
					tempCorpuscule1.velocity.x = -tempCorpuscule1.velocity.x;
				}
				// Check if we hit bottom
				else if ((tempCorpuscule1.x + tempCorpuscule1.radius) > maxX && (tempCorpuscule1.velocity.x > 0))
				{
					// reverse velocity
					tempCorpuscule1.velocity.x = -tempCorpuscule1.velocity.x;
				}
				// Check if we hit left side
				if (((tempCorpuscule1.y - tempCorpuscule1.radius) < minY) && (tempCorpuscule1.velocity.y < 0))
				{
					// reverse velocity
					tempCorpuscule1.velocity.y = -tempCorpuscule1.velocity.y;
				}
				// Check if we hit right side
				else if (((tempCorpuscule1.y + tempCorpuscule1.radius) > maxY) && (tempCorpuscule1.velocity.y > 0))
				{
					// reverse velocity
					tempCorpuscule1.velocity.y = -tempCorpuscule1.velocity.y;
				}
				
			}
		}
		
		private function collideCorpuscules(corpuscule1:AnimateCorpuscule, corpuscule2:AnimateCorpuscule):void
		{
			// calculate the distance between center of balls with the Pytagorean theorem
			var dx:Number = corpuscule1.x - corpuscule2.x;
			var dy:Number = corpuscule1.y - corpuscule2.y;
			
			// calculate the angle of the collision in radians
			var collisionAngle:Number = Math.atan2(dy, dx);
			
			// calculate the velocity vector for each ball
			// using existing ball X & Y velocities
			var speed1:Number = Math.sqrt(corpuscule1.velocity.x * corpuscule1.velocity.x + corpuscule1.velocity.y * corpuscule1.velocity.y)
			var speed2:Number = Math.sqrt(corpuscule2.velocity.x * corpuscule2.velocity.x + corpuscule2.velocity.y * corpuscule2.velocity.y)
			
			// calculate the angle in radians for each ball using it's current velocities
			// Calculate the angle formed by vector velocity of each ball, knowing your direction.
			var direction1:Number = Math.atan2(corpuscule1.velocity.y, corpuscule1.velocity.x);
			var direction2:Number = Math.atan2(corpuscule2.velocity.y, corpuscule2.velocity.x);
			
			// rotate the vectors counterclockwise so we can
			// calculate the conservation of momentum next
			var velocityX1:Number = speed1 * Math.cos(direction1 - collisionAngle);
			var velocityY1:Number = speed1 * Math.sin(direction1 - collisionAngle);
			var velocityX2:Number = speed2 * Math.cos(direction2 - collisionAngle);
			var velocityY2:Number = speed2 * Math.sin(direction2 - collisionAngle);
			
			// take the mass of each ball and update their velocities based
			// on the law of conservation of momentum
			var finalVelocityX1:Number = ((corpuscule1.mass - corpuscule2.mass) * velocityX1 + (corpuscule2.mass + corpuscule2.mass) * velocityX2) / (corpuscule1.mass + corpuscule2.mass);
			var finalVelocityX2:Number = ((corpuscule1.mass + corpuscule1.mass) * velocityX1 + (corpuscule2.mass - corpuscule1.mass) * velocityX2) / (corpuscule1.mass + corpuscule2.mass);
			
			// Y velocities stay constant
			// because this is an 1D environment collision
			var finalVelocityY1:Number = velocityY1;
			var finalVelocityY2:Number = velocityY2;
			
			// after we have our final velocities, we rotate the angles back
			// so that the collision angle is preserved
			corpuscule1.velocity.x = Math.cos(collisionAngle) * finalVelocityX1 + Math.cos(collisionAngle + Math.PI / 2) * finalVelocityY1;
			corpuscule1.velocity.y = Math.sin(collisionAngle) * finalVelocityX1 + Math.sin(collisionAngle + Math.PI / 2) * finalVelocityY1;
			corpuscule2.velocity.x = Math.cos(collisionAngle) * finalVelocityX2 + Math.cos(collisionAngle + Math.PI / 2) * finalVelocityY2;
			corpuscule2.velocity.y = Math.sin(collisionAngle) * finalVelocityX2 + Math.sin(collisionAngle + Math.PI / 2) * finalVelocityY2;
			
			// add velocity to ball positions
			corpuscule1.x += corpuscule1.velocity.x;
			corpuscule1.y += corpuscule1.velocity.y;
			corpuscule2.x += corpuscule2.velocity.x;
			corpuscule2.y += corpuscule2.velocity.y;
		}
		
		private function hitTestCircle(corpuscule1:AnimateCorpuscule, corpuscule2:AnimateCorpuscule):Boolean
		{
			var retval:Boolean = false;
			
			var distance:Number = getDistance(corpuscule1.x - corpuscule2.x, corpuscule1.y - corpuscule2.y);
			
			if (distance <= (corpuscule1.radius + corpuscule2.radius))
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