

publish:
	wintersmith build
	rm -fr build/css build/js build/assets/contents
	rsync -vaP build/ alma:~/etabits.com/public/
