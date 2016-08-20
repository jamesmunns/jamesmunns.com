git push -f lappy master
ssh homelap "cd blog && \
	git reset --hard HEAD && \
	JEKYLL_ENV=production jekyll build && \
	cp ./favicon.ico ./_site && \
	docker build -t jamesblag . && \
	docker stop james-blog; \
	docker rm james-blog; \
	docker run --name james-blog -d -p 8080:80 jamesblag"
