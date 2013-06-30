source $myScripts/Translator/Translator.vim
source $myScripts/Translator/TranslateVal.vim
source $myScripts/Translator/GetAccessTokenVal.vim

function! TranslatorController()

python <<EOM

import urllib
import urllib2
import json
import re

translator = Translator()
EOM

endfunction
