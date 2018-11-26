ROM tomcat:8-jre8

RUN apt-get update -y \
    && apt-get install -y curl tar file xz-utils build-essential

RUN apt-get install -y cmake libfreetype6-dev libfontconfig1-dev xclip

#fontconfig-config fontconfig libfreetype6

RUN apt-get install -y   libpng-dev libltdl-dev libjpeg-dev libtiff-dev git

  RUN cd /tmp \
  && curl -SLO "http://www.imagemagick.org/download/ImageMagick-7.0.8-14.tar.xz" \
  && curl -SLO "http://www.imagemagick.org/download/ImageMagick-7.0.8-14.tar.xz.asc" \
  && tar xf "ImageMagick-7.0.8-14.tar.xz" \
  && cd "ImageMagick-7.0.8-14" \
  && ./configure \
    --enable-static \
    --enable-shared \
    --enable-hdri=yes \
    --with-modules \
    --with-fftw \
    --with-webp=yes \
    --with-jpeg \
    --with-jp2 \
    --with-hdri \
    --with-openjp2 \
    --with-png \
    --with-tiff \
    --with-quantum-depth=8 \
    --with-fontconfig=yes \
    --with-freetype=yes \
  && make \
  && make install \
  && ldconfig /usr/local/lib
