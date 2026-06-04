#TODO write a description for this script
#@author 
#@category _NEW_
#@keybinding 
#@menupath 
#@toolbar 
#@runtime Jython


#currentProgram is built-in var for currently loaded program interface
#to then work with functions, we need to get the function manager
func_manager = currentProgram.getFunctionManager()

app_funcs = func_manager.getFunctions(True)
for func in app_funcs:
    print(func.getName())
    if func.getName() == "vulnerable":
        print("ADDED COMMENT")
        func.setComment("This is my comment...")


