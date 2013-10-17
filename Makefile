update-fonts:
	cp ../fonts/etabits/font/* contents/font/
	cp ../fonts/etabits/css/etabits.css contents/css/40-etabits.css
	cp ../fonts/etabits/css/etabits-ie7.css contents/css/

publish:
	wintersmith build
	rm -fr build/assets/contents
	rsync -vaP build/ alma:~/etabits.com/public/
