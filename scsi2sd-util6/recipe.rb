class Scsi2sdUtil6 < FPM::Cookery::Recipe
  name 'scsi2sd-util6'
  version '6.3.1'
  revision '1'

  homepage 'https://www.codesrc.com/mediawiki/index.php?title=SCSI2SD'
  source   "http://www.codesrc.com/files/scsi2sd-v6/v#{version}/linux/#{name}"
  sha256   'b61e742b110af610fd50f8c2f33f93bf621e2758d2698d15a977e01d3d5f1c0e'

  description 'Firmware update utility and configuration tool for SCSI2SD SCSI Hard Drive Emulators'

  license 'MIT'

  def build; end

  def install
    bin.install name
    chmod 0755, bin(name)
    share('applications').install workdir("#{name}.desktop")
  end
end
