cask 'intellij-idea-eap' do
  version '144.4199.23'
  sha256 '1c485ea0ce93c6e78612ec767d16464102e07a0c22a12bd063dcdc1f625f23b6'

  url "https://download.jetbrains.com/idea/ideaIU-#{version}.dmg"
  name 'IntelliJ IDEA EAP'
  homepage 'https://confluence.jetbrains.com/display/IDEADEV/IDEA+16+EAP'
  license :commercial

  app 'IntelliJ IDEA 16 EAP.app'

  zap delete: [
                '~/Library/Preferences/com.jetbrains.intellij.plist',
                '~/Library/Application Support/IntelliJIdea16',
                '~/Library/Preferences/IntelliJIdea16',
                '~/Library/Caches/IntelliJIdea16',
                '~/Library/Logs/IntelliJIdea16',
              ]
end
