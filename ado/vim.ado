capture program drop vim
program vim
	version 8
	* discard
	if c(os) == "MacSOX" {
		winexec mvim `*' 
	}
	else if c(os) == "Windows" {
		winexec C:\Program Files (x86)\Vim\vim82\gvim.exe `*'
	}
end
