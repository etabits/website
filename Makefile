

publish:
	wintersmith build
	rm -fr build/assets/contents
	rsync -vaP build/ alma:~/etabits.com/public/
