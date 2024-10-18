# Custom FreeBSD Port: ppsspp

This is a quick-and-dirty custom Port of PPSSPP that I created to build PPSSPP on FreeBSD against ffmpeg-3.0.2 instead of more broken (for purposes of PSP game compatibility) later versions.

As documented in numerous places by the PPSSPP devs, any version of ffmpeg over 3.0.2 starts to break PPSSPP's normally excellent PSP game compatibility:

https://github.com/hrydgard/ppsspp/issues/15308#issuecomment-1030655799

https://github.com/hrydgard/ppsspp/issues/17336

https://github.com/hrydgard/ppsspp/issues/6663

https://github.com/hrydgard/ppsspp/issues/15969

https://github.com/hrydgard/ppsspp/issues/15788

https://github.com/hrydgard/ppsspp/issues/11490#issuecomment-782735810

https://github.com/Homebrew/homebrew-core/issues/84737

Philosophical discussions about The Right Way to port software, or the risks involved with running oudated versions of software, aside, I like PPSSPP to play games containing FMVs without randomly crashing. The following games crash to the point of being unplayable using the FreeBSD Ports or official packages version of PPSSPP, built against current ffmpeg (6.x branch), but are playable all the way through with ppsspp-1.17.1 when forced to use ffmpeg-3.0.2 instead of current ffmpeg 6.x:

Persona

Crisis Core Final Fantasy VII

The Legend of Nayuta: Boundless Trails

Ys Seven

...and many more!

This was tested on amd64 FreeBSD 14.1, when built against the following versions of shared libs required by ppsspp-1.17.1_1:

        libzstd.so.1
        libzip.so.5
        libswscale.so.4
        libswresample.so.2
        libsnappy.so.1
        libpng16.so.16
        libminiupnpc.so.18
        libavutil.so.55
        libavformat.so.57
        libavcodec.so.57
        libSDL2-2.0.so.0
        libOpenGL.so.0
        libGLEW.so.2

It can be built directly from source utilizing the command `make install clean` or integrated into a synth or poudriere build with some creativity.

Note: although I patched cmake/Modules/FindFFmpeg.cmake to look for ffmpeg3-3.0.2 in my custom install directory, in a "dirty" build environment (Ports tree, portmaster, portupgrade), if the standard version of multimedia/ffmpeg (currently 6.1.2_4,1) is installed, configure will detect it and link against it during the PPSSPP build process. This defeats the purpose of this custom port. A quick-and-dirty workaround is:

	sudo pkg create ffmpeg
	sudo pkg delete -f ffmpeg

Before attempting to build this custom PPSSPP port. Once finished:

	sudo pkg add ffmpeg

(Note the use of `pkg add`, to restore our local backup we created, instead of `pkg install` to fetch it from the remote package repository).

The above workaround is unnecessary if building PPSSPP in a "clean" build environment such as provided when using synth or poudriere to build custom packages, or in a jail for that matter.
