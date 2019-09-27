# To build the docker image:
    P=proxy.com:8000
    docker build \
        --build-arg HTTP_PROXY=http://$P \
        --build-arg http_proxy=http://$P \
        --build-arg HTTPS_PROXY=$P \    
        -t vspkgenerator . 


# To run:
    docker run -v `pwd`:/out --rm vspkgenerator <lang> <spec tag>

    "lang" can be any of the languages supported by vspkgenerator. i.e: "java" or "csharp" or "python" ...


# Example:
    docker build -t vspkgenerator .
    docker run -v `pwd`:/out --rm vspkgenerator java r6.0.1
