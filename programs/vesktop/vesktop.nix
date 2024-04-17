{ config, pkgs, ...}: {
	# home.file.".config/VencordDesktop/VencordDesktop/settings/settings.json".text = ''{
	# 	"notifyAboutUpdates": true,
	# 	"autoUpdate": false,
	# 	"autoUpdateNotification": true,
	# 	"useQuickCss": true,
	# 	"themeLinks": [
	# 		"https://catppuccin.github.io/discord/dist/catppuccin-mocha-teal.theme.css"
	# 	],
	# 	"enabledThemes": [],
	# 	"enableReactDevtools": false,
	# 	"frameless": false,
	# 	"transparent": false,
	# 	"winCtrlQ": false,
	# 	"macosTranslucency": false,
	# 	"disableMinSize": false,
	# 	"winNativeTitleBar": false,
	# 	"plugins": {
	# 		"BadgeAPI": {
	# 			"enabled": true
	# 		},
	# 		"CommandsAPI": {
	# 			"enabled": true
	# 		},
	# 		"ContextMenuAPI": {
	# 			"enabled": true
	# 		},
	# 		"MemberListDecoratorsAPI": {
	# 			"enabled": false
	# 		},
	# 		"MessageAccessoriesAPI": {
	# 			"enabled": false
	# 		},
	# 		"MessageDecorationsAPI": {
	# 			"enabled": false
	# 		},
	# 		"MessageEventsAPI": {
	# 			"enabled": true
	# 		},
	# 		"MessagePopoverAPI": {
	# 			"enabled": false
	# 		},
	# 		"NoticesAPI": {
	# 			"enabled": true
	# 		},
	# 		"ServerListAPI": {
	# 			"enabled": false
	# 		},
	# 		"NoTrack": {
	# 			"enabled": true
	# 		},
	# 		"Settings": {
	# 			"enabled": true,
	# 			"settingsLocation": "aboveActivity"
	# 		},
	# 		"SupportHelper": {
	# 			"enabled": true
	# 		},
	# 		"AlwaysAnimate": {
	# 			"enabled": false
	# 		},
	# 		"AlwaysTrust": {
	# 			"enabled": false
	# 		},
	# 		"AnonymiseFileNames": {
	# 			"enabled": false
	# 		},
	# 		"WebRichPresence (arRPC)": {
	# 			"enabled": false
	# 		},
	# 		"BANger": {
	# 			"enabled": false
	# 		},
	# 		"BetterFolders": {
	# 			"enabled": true,
	# 			"sidebar": true,
	# 			"showFolderIcon": 1,
	# 			"closeAllHomeButton": false,
	# 			"keepIcons": false
	# 		},
	# 		"BetterGifAltText": {
	# 			"enabled": true
	# 		},
	# 		"BetterNotesBox": {
	# 			"enabled": true,
	# 			"hide": false
	# 		},
	# 		"BetterRoleDot": {
	# 			"enabled": false
	# 		},
	# 		"BetterUploadButton": {
	# 			"enabled": false
	# 		},
	# 		"BiggerStreamPreview": {
	# 			"enabled": false
	# 		},
	# 		"BlurNSFW": {
	# 			"enabled": true,
	# 			"blurAmount": 10
	# 		},
	# 		"CallTimer": {
	# 			"enabled": false
	# 		},
	# 		"ClearURLs": {
	# 			"enabled": true
	# 		},
	# 		"ClientTheme": {
	# 			"enabled": false
	# 		},
	# 		"ColorSighted": {
	# 			"enabled": false
	# 		},
	# 		"ConsoleShortcuts": {
	# 			"enabled": false
	# 		},
	# 		"CopyUserURLs": {
	# 			"enabled": false
	# 		},
	# 		"CrashHandler": {
	# 			"enabled": true
	# 		},
	# 		"CustomRPC": {
	# 			"enabled": false
	# 		},
	# 		"Dearrow": {
	# 			"enabled": false
	# 		},
	# 		"DisableDMCallIdle": {
	# 			"enabled": true
	# 		},
	# 		"EmoteCloner": {
	# 			"enabled": false
	# 		},
	# 		"Experiments": {
	# 			"enabled": false
	# 		},
	# 		"F8Break": {
	# 			"enabled": false
	# 		},
	# 		"FakeNitro": {
	# 			"enabled": false
	# 		},
	# 		"FakeProfileThemes": {
	# 			"enabled": false
	# 		},
	# 		"FavoriteEmojiFirst": {
	# 			"enabled": true
	# 		},
	# 		"FavoriteGifSearch": {
	# 			"enabled": true
	# 		},
	# 		"FixImagesQuality": {
	# 			"enabled": false
	# 		},
	# 		"FixSpotifyEmbeds": {
	# 			"enabled": true
	# 		},
	# 		"ForceOwnerCrown": {
	# 			"enabled": false
	# 		},
	# 		"FriendInvites": {
	# 			"enabled": false
	# 		},
	# 		"GameActivityToggle": {
	# 			"enabled": false
	# 		},
	# 		"GifPaste": {
	# 			"enabled": false
	# 		},
	# 		"GreetStickerPicker": {
	# 			"enabled": false
	# 		},
	# 		"HideAttachments": {
	# 			"enabled": false
	# 		},
	# 		"iLoveSpam": {
	# 			"enabled": false
	# 		},
	# 		"IgnoreActivities": {
	# 			"enabled": false
	# 		},
	# 		"ImageZoom": {
	# 			"enabled": false
	# 		},
	# 		"InvisibleChat": {
	# 			"enabled": false
	# 		},
	# 		"KeepCurrentChannel": {
	# 			"enabled": false
	# 		},
	# 		"LastFMRichPresence": {
	# 			"enabled": false
	# 		},
	# 		"LoadingQuotes": {
	# 			"enabled": false
	# 		},
	# 		"MemberCount": {
	# 			"enabled": false
	# 		},
	# 		"MessageClickActions": {
	# 			"enabled": false
	# 		},
	# 		"MessageLinkEmbeds": {
	# 			"enabled": false
	# 		},
	# 		"MessageLogger": {
	# 			"enabled": false
	# 		},
	# 		"MessageTags": {
	# 			"enabled": false
	# 		},
	# 		"MoreCommands": {
	# 			"enabled": false
	# 		},
	# 		"MoreKaomoji": {
	# 			"enabled": false
	# 		},
	# 		"MoreUserTags": {
	# 			"enabled": false
	# 		},
	# 		"Moyai": {
	# 			"enabled": false
	# 		},
	# 		"MuteNewGuild": {
	# 			"enabled": false
	# 		},
	# 		"MutualGroupDMs": {
	# 			"enabled": false
	# 		},
	# 		"NoBlockedMessages": {
	# 			"enabled": false
	# 		},
	# 		"NoDevtoolsWarning": {
	# 			"enabled": false
	# 		},
	# 		"NoF1": {
	# 			"enabled": false
	# 		},
	# 		"NoMosaic": {
	# 			"enabled": false
	# 		},
	# 		"NoPendingCount": {
	# 			"enabled": false
	# 		},
	# 		"NoProfileThemes": {
	# 			"enabled": false
	# 		},
	# 		"NoReplyMention": {
	# 			"enabled": false
	# 		},
	# 		"NoScreensharePreview": {
	# 			"enabled": false
	# 		},
	# 		"NoTypingAnimation": {
	# 			"enabled": false
	# 		},
	# 		"NoUnblockToJump": {
	# 			"enabled": false
	# 		},
	# 		"NormalizeMessageLinks": {
	# 			"enabled": false
	# 		},
	# 		"NSFWGateBypass": {
	# 			"enabled": false
	# 		},
	# 		"OnePingPerDM": {
	# 			"enabled": false
	# 		},
	# 		"oneko": {
	# 			"enabled": false
	# 		},
	# 		"OpenInApp": {
	# 			"enabled": false
	# 		},
	# 		"Party mode 🎉": {
	# 			"enabled": false
	# 		},
	# 		"PermissionFreeWill": {
	# 			"enabled": false
	# 		},
	# 		"PermissionsViewer": {
	# 			"enabled": false
	# 		},
	# 		"petpet": {
	# 			"enabled": false
	# 		},
	# 		"PictureInPicture": {
	# 			"enabled": false
	# 		},
	# 		"PinDMs": {
	# 			"enabled": false
	# 		},
	# 		"PlainFolderIcon": {
	# 			"enabled": false
	# 		},
	# 		"PlatformIndicators": {
	# 			"enabled": false
	# 		},
	# 		"PreviewMessage": {
	# 			"enabled": false
	# 		},
	# 		"PronounDB": {
	# 			"enabled": false
	# 		},
	# 		"QuickMention": {
	# 			"enabled": false
	# 		},
	# 		"QuickReply": {
	# 			"enabled": false
	# 		},
	# 		"ReactErrorDecoder": {
	# 			"enabled": false
	# 		},
	# 		"ReadAllNotificationsButton": {
	# 			"enabled": false
	# 		},
	# 		"RelationshipNotifier": {
	# 			"enabled": false
	# 		},
	# 		"RevealAllSpoilers": {
	# 			"enabled": false
	# 		},
	# 		"ReverseImageSearch": {
	# 			"enabled": false
	# 		},
	# 		"RoleColorEverywhere": {
	# 			"enabled": false
	# 		},
	# 		"SearchReply": {
	# 			"enabled": false
	# 		},
	# 		"SecretRingToneEnabler": {
	# 			"enabled": false
	# 		},
	# 		"SendTimestamps": {
	# 			"enabled": false
	# 		},
	# 		"ServerListIndicators": {
	# 			"enabled": false
	# 		},
	# 		"ServerProfile": {
	# 			"enabled": false
	# 		},
	# 		"ShikiCodeblocks": {
	# 			"enabled": false
	# 		},
	# 		"ShowAllMessageButtons": {
	# 			"enabled": false
	# 		},
	# 		"ShowConnections": {
	# 			"enabled": false
	# 		},
	# 		"ShowHiddenChannels": {
	# 			"enabled": false
	# 		},
	# 		"ShowMeYourName": {
	# 			"enabled": false
	# 		},
	# 		"ShowTimeouts": {
	# 			"enabled": false
	# 		},
	# 		"SilentMessageToggle": {
	# 			"enabled": false
	# 		},
	# 		"SilentTyping": {
	# 			"enabled": false
	# 		},
	# 		"SortFriendRequests": {
	# 			"enabled": false
	# 		},
	# 		"SpotifyControls": {
	# 			"enabled": false
	# 		},
	# 		"SpotifyCrack": {
	# 			"enabled": false
	# 		},
	# 		"SpotifyShareCommands": {
	# 			"enabled": false
	# 		},
	# 		"StartupTimings": {
	# 			"enabled": false
	# 		},
	# 		"SuperReactionTweaks": {
	# 			"enabled": false
	# 		},
	# 		"TextReplace": {
	# 			"enabled": false
	# 		},
	# 		"ThemeAttributes": {
	# 			"enabled": false
	# 		},
	# 		"TimeBarAllActivities": {
	# 			"enabled": false
	# 		},
	# 		"Translate": {
	# 			"enabled": false
	# 		},
	# 		"TypingIndicator": {
	# 			"enabled": false
	# 		},
	# 		"TypingTweaks": {
	# 			"enabled": false
	# 		},
	# 		"Unindent": {
	# 			"enabled": false
	# 		},
	# 		"UnsuppressEmbeds": {
	# 			"enabled": false
	# 		},
	# 		"UrbanDictionary": {
	# 			"enabled": false
	# 		},
	# 		"UserVoiceShow": {
	# 			"enabled": false
	# 		},
	# 		"USRBG": {
	# 			"enabled": false
	# 		},
	# 		"ValidUser": {
	# 			"enabled": false
	# 		},
	# 		"VoiceChatDoubleClick": {
	# 			"enabled": false
	# 		},
	# 		"VcNarrator": {
	# 			"enabled": false
	# 		},
	# 		"VencordToolbox": {
	# 			"enabled": false
	# 		},
	# 		"ViewIcons": {
	# 			"enabled": false
	# 		},
	# 		"ViewRaw": {
	# 			"enabled": false
	# 		},
	# 		"VoiceMessages": {
	# 			"enabled": false
	# 		},
	# 		"WebContextMenus": {
	# 			"enabled": true,
	# 			"addBack": true
	# 		},
	# 		"WebKeybinds": {
	# 			"enabled": true
	# 		},
	# 		"WhoReacted": {
	# 			"enabled": false
	# 		},
	# 		"Wikisearch": {
	# 			"enabled": false
	# 		}
	# 	},
	# 	"notifications": {
	# 		"timeout": 5000,
	# 		"position": "top-right",
	# 		"useNative": "not-focused",
	# 		"logLimit": 50
	# 	},
	# 	"cloud": {
	# 		"authenticated": false,
	# 		"url": "https://api.vencord.dev/",
	# 		"settingsSync": false,
	# 		"settingsSyncVersion": 1712416482530
	# 	}
	# }'';
	# home.file.".config/VencordDesktop/VencordDesktop/settings.json".text = ''{
	# 	"minimizeToTray": "on",
	# 	"discordBranch": "stable",
	# 	"firstLaunch": false,
	# 	"arRPC": "on",
	# 	"splashColor": "rgb(205, 214, 244)",
	# 	"splashBackground": "rgb(30, 30, 46)",
	# 	"splashTheming": true,
	# 	"windowBounds": {
	# 		"x": 21,
	# 		"y": 46,
	# 		"width": 1878,
	# 		"height": 1013
	# 	}
	# }'';
}
