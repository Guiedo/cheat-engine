package.path = package.path .. ";?.lua";

--This lua script gets loaded when Cheat Engine loads
--You can use this to define some often used functions and libraries you'd like to use

require("defines")

--
--List of CE specific functions:
--readBytes(address,bytecount) : Reads the bytes at the given address and returns it
--writeBytes(address, x,x,x,x) : Write the given bytes to the given address
--readBytesLocal(address,bytecount) : See readBytes but then it's for Cheat engine's memory
--writeBytesLocal(address, x,x,x,x) : See writeBytes but then it's for Cheat Engine's memory
--autoAssemble(text) : runs the auto assembler with the given text. Returns true on success
--showMessage(text) : shows a messagebox with the given text
--sleep(milliseconds): pauses for the number of specified milliseconds (1000= 1 sec...)

--getProcessIDFromProcessName(name) : returns a processid
--openProcess(processid) : causes cheat engine to open the given processid
--openProcess(processname): causes cheat engine to find and open the given process
--pause : pauses the current opened process
--unpause: resumes the current opened process


--getPixel(x,y) : returns the rgb value of the pixel at the specific screen coordinate
--getMousePos: returns the x,y coordinates of the mouse
--setMousePos(x,y): sets the mouse position

--isKeyPressed(key) : returns true if the specified key is currently pressed
--keyDown(key) : causes the key to go into down state
--keyUp(key) :causes the key to go up
--doKeyPress(key) : simmulates a key press



--Cheat table functions:
--createTableEntry: creates an generic cheat table entry and add it to the list. Returns a tableentry pointer you can use with memrec routines
--getTableEntry(descriptionname): returns a tableEntry pointer for use with memrec functions
--memrec_setDescription(te, description): sets the specified description for this entry
--memrec_getDescription(te): gets the current description of this entry
--memrec_getAddress(te): returns the address and optional offsets for a pointer (note that in 64-bit kernelmode addresses will be rounded down...)
--memrec_setAddress(te,address,offsets OPTIONAL)
--memrec_getType(te)
--memrec_setType(te, vartype)
--memrec_getValue(te): returns the current value of the cheat table entry as a string
--memrec_setValue(te, value): sets the value of a cheat table entry
--memrec_getScript(te) : If the entry is of type vtAutoAssembler then you can get the script with this routine
--memrec_setScript(te, script)
--memrec_freeze(te, updownfreeze OPTIONAL): sets the entry to frozen state. updownfreeze is optional. 0=freeze, 1=allow increase, 2=allow decrease
--memrec_unfreeze(te) :unfreezes an entry
--memrec_setColor(te, colorrgb): Sets the color of the entry
--memrec_appendToEntry(te,te) : Adds the entry to another entry
--memrec_delete(te) : It's unknown what this function does, all that is known is that after using this command other memrec routines with this table entry value don't work anymore...


--Table related routines:
--If a cheat entry is about to get enabled or disabled it will check if a lua function named "_memrec_description_activating" or "_memrec_description_deactivating" is available, and if so call it.
--If a cheat entry is enabled or disabled it will check if a lua function named "_memrec_description_activated" or "_memrec_description_deactivated" is available, and if so call it.
--It passes the tableEntry pointer as parameter
--Example:
--If the cheat entry table with description "xxx" gets enabled it will call "_memrec_xxx_activating(te)" before it is activated and "_memrec_xxx_activated(te)" after it has been activated
--If the cheat entry table with description "xxx" gets disabled it will call "_memrec_xxx_deactivating(te)" before it is activated and "_memrec_xxx_deactivated(te)" after it has been deactivated

-----debugging------

--debug variables
--EAX, EBX, ECX, EDX, EDI, ESP, EBP, ESP, EIP
--RAX, EBX, RBX, RDX, RDI, RSP, RBP, RSP, RIP, R8, R9, R10, R11, R12, R13, R14, R15 : The value of the register

--Debug related routines:
--When a breaking breakpoint hits and the lua function debugger_onBreakpoint() is defined it will be called and the global variables EAX, EBX, .... will be filled in
--Return 0 if you want the userinterface toi be updated and enything else if not (e.g: You continued from the breakpoint in your script)


--debugProcess(interface OPT): starts the debugger for the currently opened process (won't ask the user) Optional interface: 0=default, 1=windows debug, 2=VEHDebug, 3=Kerneldebug
--debug_setBreakpoint(address, size OPTIONAL, trigger OPTIONAL) : sets a breakpoint of a specific size at the given address. if trigger is bptExecute then size is ignored. If trigger is ignored then it will be of type bptExecute, which obviously also ignores the size then as well
--debug_removeBreakpoint(address) : if the given address is a part of a breakpoint it will be removed
--debug_continueFromBreakpoint(continueMethod) : if the debugger is currently waiting to continue you can continue with this. Valid parameters are :co_run (just continue), co_stepinto(when on top of a call, follow it), c_stepover (when on top of a call run till after the call)




--Changing registers:
--This annoying method has been chosen because LUA only supports encoding up to 52-bits, after which rounding will happen
--So automatically setting the new value would surely cause unpredictable behaviour if the target app uses higher values

--hasChangedARegister : Set this to true before continuing and the changedREG variables will be checked to see if the new value should be set (just an optimization so not every variable has to be checked each time even if you didn't change a thing)
--changedEAX, changedRAX, changedEBX, changedRBX, changed.....










