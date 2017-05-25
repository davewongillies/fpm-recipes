class VirtualenvTools < FPM::Cookery::PythonRecipe
  name     'virtualenv-tools'
  description 'Tools for dealing with virtualenvs for code deployments.'
  version  '1.0.0'
  revision '1'
  homepage 'https://github.com/fireteam/virtualenv-tools'

  build_depends 'python-setuptools'
  depends       'python'

end
