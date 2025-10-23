## How to make this project fail

```bash
nix build .
```

outputs:

```
error: builder for '/nix/store/zc9a32jdw8fsd9zinx66l3v8pddkvdy3-nix_package-0.1.0.drv' failed with exit code 1;
       last 25 log lines:
       > ==> bandit
       > Compiling 54 files (.ex)
       > Generated bandit app
       > ==> swoosh
       > Compiling 54 files (.ex)
       > Generated swoosh app
       > ==> websock_adapter
       > Compiling 4 files (.ex)
       > Generated websock_adapter app
       > ==> phoenix
       > Compiling 74 files (.ex)
       > Generated phoenix app
       > ==> phoenix_live_view
       > Compiling 49 files (.ex)
       > Generated phoenix_live_view app
       > ==> phoenix_live_dashboard
       > Compiling 36 files (.ex)
       > Generated phoenix_live_dashboard app
       > Running phase: buildPhase
       > Compiling 15 files (.ex)
       > Generated nix_package app
       > Unchecked dependencies for environment prod:
       > * heroicons (https://github.com/tailwindlabs/heroicons.git - v2.2.0)
       >   lock mismatch: the dependency is out of date. To fetch locked version run "mix deps.get"
       > ** (Mix) Can't continue due to errors on dependencies
       For full logs, run:
         nix log /nix/store/zc9a32jdw8fsd9zinx66l3v8pddkvdy3-nix_package-0.1.0.drv
```
