# Local updates to FreeBSD Port: ppsspp

This started out as a custom Port of PPSSPP that I created to build PPSSPP on FreeBSD against ffmpeg-3.0.2 instead of more broken (for purposes of PSP game compatibility) later versions. However, on 4 December 2024 it became the FreeBSD official port, so for someone wanting to install PPSSPP on FreeBSD, I recommend just using Ports/packages on your system.

I'll keep this repo public just to log my tweaks to the port prior to submission/updates to the official Port.

I started this local fork of the official FreeBSD Port because of FFmpeg-related FMV compatibility issues/random PPSSPP crashes. As documented in numerous places by the PPSSPP devs, any version of ffmpeg over 3.0.2 starts to break PPSSPP's normally excellent PSP game compatibility:

https://github.com/hrydgard/ppsspp/issues/15308#issuecomment-1030655799

https://github.com/hrydgard/ppsspp/issues/17336

https://github.com/hrydgard/ppsspp/issues/6663

https://github.com/hrydgard/ppsspp/issues/15969

https://github.com/hrydgard/ppsspp/issues/15788

https://github.com/hrydgard/ppsspp/issues/11490#issuecomment-782735810

https://github.com/Homebrew/homebrew-core/issues/84737
