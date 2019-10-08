FROM appimagecrafters/docker-base
ADD install-libpng.sh /

ARG LIBPNG_VERSION=1.6.37
RUN /install-libpng.sh