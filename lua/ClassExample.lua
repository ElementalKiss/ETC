-- create table
local CTriangle = { width = 0, height = 0 }

-- class?
function CTriangle.set( agWidth, agHeight )
  CTriangle.width = agWidth
  CTriangle.height = agHeight
end

function CTriangle.get()
  return { width = CTriangle.width, height = CTriangle.height }
end

function CTriangle.calculate()
  return CTriangle.width * CTriangle.height / 2
end

function CTriangle.print()
  print( "width = " .. CTriangle.width .. ", height = " .. CTriangle.height )
end

-- »ç¿ë¿¹

CTriangle.set(10, 5)
local getCTriangleClass = CTriangle.get()
print("w = " .. getCTriangleClass.width .. " h = " .. getCTriangleClass.height)

CTriangle.print()
print("Triangle's area = " .. CTriangle.calculate() )
