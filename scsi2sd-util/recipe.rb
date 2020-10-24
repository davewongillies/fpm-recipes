class Scsi2sdUtil < FPM::Cookery::Recipe
  name 'scsi2sd-util'
  version '4.8.4'
  revision '1'

  homepage 'https://www.codesrc.com/mediawiki/index.php?title=SCSI2SD'
  source   "https://www.codesrc.com/files/scsi2sd/v#{version}/linux/#{name}"
  sha256   '8633ff3ec6ca1872b5f9c3469a4208eb3bbe45937331c616341dc0668f6feca1'

  description 'Firmware update utility and configuration tool for SCSI2SD SCSI Hard Drive Emulators'

  license 'MIT'

  def build; end

  def install
    bin.install name
    chmod 0755, bin(name)
    share('applications').install workdir("#{name}.desktop")
  end
end
