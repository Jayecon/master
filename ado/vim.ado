capture program drop vim
program vim
	version 14
	if c(os) == "MacSOX" {
		winexec mvim `*' 
	}
	else if c(os) == "Windows" {
		winexec C:\Program Files (x86)\Vim\vim82\gvim.exe `*'
	}
end
