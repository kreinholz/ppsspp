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
        libsnappy.so.1
        libpng16.so.16
        libminiupnpc.so.18
        libSDL2-2.0.so.0
        libOpenGL.so.0
        libGLEW.so.2

It can be built directly from source utilizing the command `make install clean` or integrated into a synth or poudriere build.

As of commit aeb9b2f (29 October 2024), this PPSSPP port expects ffmpeg3 to be built with static libs, which it will bundle into the final PPSSPP binary. What this means for end-users is no external dependency of ffmpeg3--it's now a build dependency only. After building emulators/ppsspp, multimedia/ffmpeg3 can be safely deleted. Even better, package management systems like poudriere or synth that build packages in a clean environment will not install ffmpeg3 onto your system at all--they'll build it as part of the ppsspp build process, then install only the ppsspp package.

If accepted into the FreeBSD Ports tree, this'll mean pkg users will never have to install ffmpeg3 at all--they can just fetch and install the latest ppsspp package which will have bundled_ffmpeg underneath the hood.
