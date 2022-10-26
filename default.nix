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
    homepage = "https://your.repo.url.here";
    description = "This project was generated with fastapi-mvc.";
  };
}
