-- import library
json = require('json')
require('jsonFileProcessor')

-- main function 
function main()
	local fileName = "test"
	local filePath = "../json/jsons/"..fileName..".json"
	local testJson = FileRead(filePath)
	
	-- for table print
	if testJson then
		for i = 1, #testJson, 1 do
			table.foreach(testJson[i], print)
		end
	end
	
	FileWrite(filePath, testJson)
	local filePath = "../json/jsons/"..fileName.."_pretty.json"
	FileWrite(filePath, testJson, true)

	return
end

-- call main
main()