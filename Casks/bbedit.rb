cask 'bbedit' do
  if MacOS.version <= :el_capitan
    version '12.1.6'
    sha256 '23b9fc6ef5c03cbcab041566503c556d5baf56b2ec18f551e6f0e9e6b48dc690'
  elsif MacOS.version <= :high_sierra
    version '12.6.7'
    sha256 'd0647c864268b187343bd95bfcf490d6a2388579b1f8fce64a289c65341b1144'
  else
    version '13.1.2'
    sha256 'b7533d815ef1f1e040f9cb79260d8dd3ed334a17e6b178ecca63c3d69a4575a1'
  end
  # s3.amazonaws.com/BBSW-download/ was verified as official when first introduced to the cask
  url "https://s3.amazonaws.com/BBSW-download/BBEdit_#{version}.dmg"
  appcast 'https://versioncheck.barebones.com/BBEdit.xml'
  name 'BBEdit'
  homepage 'https://www.barebones.com/products/bbedit/'

  auto_updates true
  depends_on macos: '>= :el_capitan'

  app 'BBEdit.app'

  zap trash: [
               '~/Library/Application Support/BBEdit',
               '~/Library/Preferences/com.barebones.bbedit.plist',
               '~/Library/BBEdit',
               '~/Library/Caches/com.barebones.bbedit',
             ]
end
