-- Meta Class
Rectangle = {area = 0, length = 0}

-- Base Class

function Rectangle:New(cpyRect,length)
-- copy constructure?
   newRect = cpyRect or {}
   setmetatable(newRect, self)
   self.__index = self


   self.length = length or 0
   self.area = length*length;
   return newRect
end

-- Method

function Rectangle:printArea ()
   print("The area is = ",self.area)
end

-- Function
function Rectangle.printLenth (self)
   print("The length is = ", self.length)
end

-- Creating an object
myShape = Rectangle:New(nil,10)
myShape.printLenth(myShape)
myShape:printArea()

-- Creating an object using SomeClass
newShape = Rectangle:New(myshape, 20)
print("The length is = ", newShape.length)
newShape:printArea()