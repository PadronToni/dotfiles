#!/bin/bash


# Colors, takes color variables from Xresources file                                                                                                                                     
fore=$(xrdb -query | grep 'foreground:'| awk '{print $NF}')
bag=$(xrdb -query | grep 'background:'| awk '{print $NF}')
color0=$(xrdb -query | grep 'color0:'| awk '{print $NF}')
color8=$(xrdb -query | grep 'color8:'| awk '{print $NF}')
color1=$(xrdb -query | grep 'color1:'| awk '{print $NF}')
color9=$(xrdb -query | grep 'color9:'| awk '{print $NF}')
color2=$(xrdb -query | grep 'color2:'| awk '{print $NF}')
color10=$(xrdb -query | grep 'color10:'| awk '{print $NF}')
color3=$(xrdb -query | grep 'color3:'| awk '{print $NF}')
color11=$(xrdb -query | grep 'color11:'| awk '{print $NF}')
color4=$(xrdb -query | grep 'color4:'| awk '{print $NF}')
color12=$(xrdb -query | grep 'color12:'| awk '{print $NF}')
color5=$(xrdb -query | grep 'color5:'| awk '{print $NF}')
color13=$(xrdb -query | grep 'color13:'| awk '{print $NF}')
color6=$(xrdb -query | grep 'color6:'| awk '{print $NF}')
color14=$(xrdb -query | grep 'color14:'| awk '{print $NF}')
color7=$(xrdb -query | grep 'color7:'| awk '{print $NF}')
color15=$(xrdb -query | grep 'color15:'| awk '{print $NF}')

convert -size 200x200 xc:${bag} ~/.local/share/TelegramDesktop/bg_chat.png 

echo "
dialogsBg: $bag;
dialogsChatIconFg: $color7;
dialogsDateFg: $color7;
dialogsDraftFg: $color1;
dialogsNameFg: $fore;
dialogsTextFgService: $fore;
dialogsTextFg: $color7;
dialogsSentIconFg: $color10;
dialogsSendingIconFg: $color12;
dialogsVerifiedIconBg: $color2;
dialogsVerifiedIconFg: $fore;
dialogsUnreadFg: $fore;
dialogsUnreadBg: $color9;
dialogsUnreadBgMuted: $color0;
topBarBg: $color0;
dialogsMenuIconFg: $fore;
dialogsMenuIconFgOver: $fore;
titleBg: $bag;
emojiPanBg: $bag;
historyComposeIconFg: $fore;
menuIconFg: $fore;
trayCounterBg: #f04347ff;
trayCounterBgMute: #282c30ff;
trayCounterFg: #e7e7e7ff;
profileVerifiedCheckBg: dialogsVerifiedIconBg;
profileVerifiedCheckFg: #ffffffff;
profileAdminStartFg: #abacacff;
msgServiceFg: $color7;
msgServiceBg: $bag;
msgOutBg: $color0;
msgOutBgSelected: $color8;
msgOutShadow: #00000000;
msgOutShadowSelected: #00000000;
msgOutDateFg: $color7;
msgOutDateFgSelected: $color7;
msgFileOutBg: $color8;
msgFileOutBgOver: $color8;
msgFileOutBgSelected: $color8;
msgOutServiceFg: $color7;
msgInBg: $color0;
msgInBgSelected: $color8;
msgInShadow: #00000000;
msgInShadowSelected: #00000000;
msgInDateFg: $color7;
msgInDateFgSelected: $color7;
msgFileInBg: $color8;
msgFileInBgOver: $color8;
msgFileInBgSelected: $color8;
msgInServiceFg: $color7;
historyFileInRadialFg: $color12;
historyFileInRadialFgSelected: $color12;
historyFileOutRadialFg: $color12;
historyFileOutRadialFgSelected: $color12;
historyFileInIconFgSelected: $color12;
historyFileOutIconFgSelected: $color12;
historyToDownBg: $color8;
historyToDownFg: $fore;
historyToDownFgOver: $fore;
historyToDownShadow: #00000040;
historyPeer1UserpicBg: $color1;
historyPeer2UserpicBg: $color2;
historyPeer3UserpicBg: $color3;
historyPeer4UserpicBg: $color4;
historyPeer5UserpicBg: $color5;
historyPeer6UserpicBg: $color5;
historyPeer7UserpicBg: $color6;
historyPeerUserpicFg: $color8;
historyPeer1NameFg: $color15;
historyPeer2NameFg: $color15;
historyPeer3NameFg: $color15;
historyPeer4NameFg: $color15;
historyPeer5NameFg: $color15;
historyPeer6NameFg: $color15;
historyPeer7NameFg: $color15;
historySendingInvertedIconFg: #ffffffc8;
historyUnreadBarFg: $fore;
historyUnreadBarBg: $color8;
historyTextInFg: $fore;
historyFileNameInFg: $fore;
historyFileNameInFgSelected: $fore;
historyLinkInFg: $color14;
historySendingInIconFg: #a6a6a6ff;
historyTextOutFg: #e7e7e7ff;
historyFileNameOutFg: $fore;
historyFileNameOutFgSelected: $fore;
historyLinkOutFg: $color14;
historyOutIconFg: #e6e6e6ff;
historyOutIconFgSelected: #dfdfdfff;
historySendingOutIconFg: #ffffffff;
mainMenuBg: $bag;
boxBg: $bag;
mainMenuCoverBg: $color0;
dialogsBgActive: $color4;
windowBg: $bag;
windowBgActive: $color11;
activeButtonBg: #718bd7;
activeButtonBgOver: #718bd7ff;
activeButtonBgRipple: #5971b3;
lightButtonBg: #718bd7;
lightButtonBgOver: #5971b3;
lightButtonBgRipple: #5971b3;
windowBgRipple: #41454c;
windowBgOver: #202225;
menuBgOver: #51565eff;
contactsBgOver: #36393e;
dialogsBgOver: #36393eff;
searchedBarBg: #36393e;
historyToDownBgOver: $color8;
historyComposeButtonBgOver: #51565eff;
historyScrollBarBg: #202225;
historyScrollBg: #2e3338;
historyScrollBarBgOver: historyScrollBarBg;
historyScrollBgOver: historyScrollBg;
scrollBarBg: #202225;
scrollBg: #282c3000;
scrollBarBgOver: scrollBarBg;
scrollBgOver: #282c3000;
activeLineFg: #fcfcfcff;
msgInReplyBarColor: #5e6165ff;
msgInReplyBarSelColor: #e7e7e7ff;
windowBoldFg: #fcfcfc;
windowSubTextFg: windowBoldFg;
windowFg: #fcfcfcff;
windowActiveTextFg: #718bd7ff;
windowFgActive: #fcfcfc;
windowBoldFgOver: windowFgActive;
windowFgOver: #718bd7ff;
dialogsTextFgOver: #b9bbbeff;
dialogsNameFgOver: #fcfcfcff;
msgWaveformInActive: #697ec4ff;
msgWaveformInInactive: #e7e7e7ff;
msgWaveformInInactiveSelected: #e7e7e7ff;
msgWaveformOutActive: #697ec4ff;
msgWaveformOutInactive: #e7e7e7ff;
msgWaveformOutInactiveSelected: #e7e7e7ff;
placeholderFg: #aaaaaa;
filterInputInactiveBg: #25272b;
filterInputBorderFg: #20222500;
tooltipBg: #eef2f5ff;
tooltipFg: #818180ff;
msgInMonoFg: #e7e7e7ff;
msgOutMonoFg: #e7e7e7ff;
historyComposeAreaBg: #484b51;
activeButtonFg: historyToDownFgOver;
historyPeerSavedMessagesBg: #718bd7;
activeButtonSecondaryFg: #e7e7e7;
dialogsUnreadBgMutedActive: #718bd7;
historyPeer8UserpicBg: #40ac7b;
historyPeer8NameFg: historyPeer8UserpicBg;
boxTitleFg: #e7e7e7;
msgFileThumbLinkOutFg: #718bd7;
msgDateImgFg: #ffffff;
msgOutServiceFgSelected: #f0f0f0;
callArrowFg: #40ac7b;
callArrowMissedFg: #f04347;
callAnswerBg: #40ac7b;
callAnswerRipple: #40ac7b;
msgOutReplyBarColor: #5e6165;
dialogsDraftFgActive: #718bd7;
historyPinnedBg: #282b30;
historyComposeAreaFgService: #e7e7e7;
msgSelectOverlay: #282c3059;
msgStickerOverlay: #282c3087;
menuIconFgOver: $fore;
menuBg: #25272b;
callBg: #26282c;
callHangupBg: #f04347;
callHangupRipple: #d5464b;
historyFileInIconFg: $color12;
historyFileOutIconFg: $color12;
msgImgReplyBarColor: #686c70;
historyUnreadBarBorder: #00000000;
filterInputActiveBg: #41454c;
boxSearchBg: #36393e;
lightButtonFg: #fcfcfc;
attentionButtonBgRipple: #d8d7d7;
attentionButtonBgOver: activeButtonFg;
attentionButtonFg: attentionButtonBgRipple;
mediaPlayerBg: #2f3136;
" > ~/.local/share/TelegramDesktop/colors.tdesktop-palette


