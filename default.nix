{ lib
, python
, poetry2nix
}:

poetry2nix.mkPoetryApplication {
  inherit python;

  projectDir = ./.;
  pyproject = ./pyproject.toml;
  poetrylock = ./poetry.lock;

  pythonImportsCheck = [ "galaxy_mk2" ];

  meta = with lib; {
    homepage = "https://github.com/kykim88/galaxy-mk2";
    description = "This project was generated with fastapi-mvc.";
  };
}
