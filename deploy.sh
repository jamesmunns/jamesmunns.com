echo
echo Sending Data with Git...
echo
git push -f lappy master
ssh homelap "cd blog && \
    git reset --hard HEAD && \
    git submodule update --init --recursive && \
    echo && \
    echo Building Jekyll... && \
    echo && \
    JEKYLL_ENV=production jekyll build && \
    cp ./favicon.ico ./_site && \
    cp ./resume.pdf ./_site && \
    echo && \
    echo Building mdBook... && \
    echo && \
    cd _iot_first_principles && \
    rm -rf ./book && \
    /home/james/.cargo/bin/mdbook build && \
    cd ../ && \
    cp -R ./_iot_first_principles/book ./_site/ && \
    mv ./_site/book ./_site/iotbook && \
    echo && \
    echo Dockering... && \
    echo && \
    docker logs --tail=all james-blog >> ~/bloglog.txt 2>&1 && \
    docker build -t jamesblag . && \
    docker stop james-blog; \
    docker rm james-blog; \
    docker run --name james-blog -d -p 8080:80 jamesblag"
