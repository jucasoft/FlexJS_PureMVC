set FLEX_JS_HOME=C:/Sviluppo/Flex/SDK/js-05
set ASJSC=%FLEX_JS_HOME%/js/bin
%ASJSC%/asjsc.bat src/Index.as --external-library-path libs/underscore.swc -define+=COMPILE::AS3,false -define+=COMPILE::JS,true