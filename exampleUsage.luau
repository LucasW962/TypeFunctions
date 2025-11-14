local TypeFunctions = require(game:GetService("ReplicatedStorage").Types.TypeFunctions)

local randomTbl = {
	name = "Yoda",
	age = 155,
	extraData = { "a" },
}

-- as the name says, makes a type partial
-- evaluated as name: string?, age: number?, extraData: {}?
type partialTbl = TypeFunctions.Partial<typeof(randomTbl)>

local notReallyNeeded: string? = ""

-- the type is evaluated as string instead of string?
-- will get rid of the potentially nil type
type stringDissolve = TypeFunctions.Dissolve<typeof(notReallyNeeded)>

-- evaulated as {[string]: boolean}? this doesnt really need to be a type function and could be a normal type though
-- this just makes it easier
local X: TypeFunctions.Record<string, boolean>? = {}

type fullUnion = "Hello" | "Hello2" | "Hello3"

-- this is evaluated as "Hello" | "Hello2" because we excluded Hello3 from the union
local excluded: TypeFunctions.Exclude<fullUnion, "Hello3">

type fullTable = {
	Props: boolean,
	Second: boolean,
	Full: string,
}

-- evaluated as only Full, as we removed all boolean types
local tblExcluded: TypeFunctions.Exclude<fullTable, boolean> = {}

type extractTable = {
	Props: boolean,
	Second: boolean,
	Full: string,
}

-- extracted works for unions but is pretty useless
local Extracted: TypeFunctions.Extract<fullUnion, "Hello3">

-- evaluated as {Props: boolean, Second: boolean} as we only want the boolean types
local txlExtracted: TypeFunctions.Extract<extractTable, boolean> = {}

type fullReadTable = {
	Full: string,
	param: any,
	inst: Instance,
}

-- write is never but read of Full will be string, trying to change the property of a table with this type will type error
-- the current type checker has some issues where this MAY not type error and just say String when assigning the property
-- i wish it would evaluate as read: String, write: never :(
type readOnlyFullTable = TypeFunctions.Readonly<fullReadTable>

local x: readOnlyFullTable = {
	Full = "Hello",
	param = {},
	inst = Instance.new("Part"),
}

x.Full = "New"

type nestedProps = {
	Full: {
		Second: {
			Third: {},
		},
	},
}

-- with normal Readonly, this wont work properly and read and write work perfectly fine with no type references
type deepReadTbl = TypeFunctions.DeepReadonly<nestedProps>

local yx: deepReadTbl = {}
