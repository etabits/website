BOOTSTRAP_COMPONENTS = type|grid|buttons|navs|thumbnails
BOOTSTRAP_DIR = /files/reps/bootstrap

bootstrap:
	cd $(BOOTSTRAP_DIR)/less && cat bootstrap.less | \
	grep -E '^@import "(variables|mixins|normalize|print|scaffolding|${BOOTSTRAP_COMPONENTS})\.less";$$' | \
	lessc - $(PWD)/contents/css/10-bootstrap.css

update-fonts:
	cp ../fonts/etabits/font/* contents/font/
	cp ../fonts/etabits/css/etabits.css contents/css/40-etabits.css
	cp ../fonts/etabits/css/etabits-ie7.css contents/css/

publish:
	wintersmith build
	rm -fr build/assets/contents
	rsync -vaP build/ alma:~/etabits.com/public/

sitemap-ping:
	wget -O- http://www.google.com/webmasters/tools/ping?sitemap=http%3A%2F%2Fwww.etabits.com%2Fsitemap.xml