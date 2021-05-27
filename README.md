# R-Project-Structure
## Description
A presentation about R project structures. It includes a basic template along with some extensions that should cover most cases. For the more advanced users, the presentation also mentions some practices such as version control and containerization.

## Useful links
- [Presentation](giuseppett.github.io/r-project-structure/presentation.html)
- [Examples](https://github.com/GiuseppeTT/R-Project-Structure/tree/main/example)

## How to run
### ... On RStudio
You can run the project in RStudio by following these steps:
- Open RStudio
- Click on "File" and then "New Project..." on the top bar. A window will open
- Select "Version Control" and then "Git"
- Paste "https://github.com/GiuseppeTT/R-Project-Structure" in the "Repository URL" field, select the parent directory of the project in "Create project as a subdirectory of" and then click on "Create Project"
- Wait for the project to be created
- Paste and execute the following commands in the R console:
    - `install.packages("devtools")`
    - `devtools::install_deps(dependencies = TRUE)`
    - `devtools::document()`
    - `devtools::install()`
- After everying, run the `render.R` script

### ... On VSCode
You can run the project inside a development container by following these steps in the VSCode code editor:
- Open VSCode
- Install the [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension
- Open the command palette (press `F1` key), select the command "Git: Clone" and clone this repository https://github.com/GiuseppeTT/R-Project-Structure.git
- Open the command palette (press `F1` key) and select the command "Remote-Containers: Open Folder in Container..."
- Open a new terminal (press `` ctrl+shift+` ``) and execute the command `Rscript render.R`

After that, the presentation will be available at `output/github-pages/presentation.html`.

Notes: you may need to install [docker](https://www.docker.com/).

### ... On terminal (linux)
You can run the project by executing the following commands in the terminal:

```bash
git clone https://github.com/GiuseppeTT/R-Project-Structure.git  # Clone project
cd R-Project-Structure                                           # Access project directory
Rscript -e "install.packages('devtools')"                        # Install {devtools}
Rscript -e "devtools::install_deps(dependencies = TRUE)"         # Install R packages
Rscript -e "devtools::document(); devtools::install()"           # Install project package
Rscript render.R                                                 # Render presentation
```

After that, the presentation will be available at `output/github-pages/presentation.html`.

Notes: you may need to install the system package `libcurl`. You can do that on Ubuntu with the command `sudo apt-get install libcurl4-openssl-dev`.

## Deploy
If you are a contributor to this repository, every time you push to the `main` branch, the `deploy` workflow will render and deploy the presentation to the [repository's GitHub Page](giuseppett.github.io/r-project-structure/presentation.html).

## Project structure
The `render.R` script is the main entrypoint.

Project structure:
- `.devcontainer/`: [VSCode Remote-Container](https://code.visualstudio.com/docs/remote/containers) files. Used for development inside a container
- `.github/`: [GitHub Action](https://github.com/features/actions) files. Used for CI/CD
- `data/`: Data files
- `example/`: Examples of projects that follow the proposed project structures
- `extra/`: Extra, non-code, files
- `man/`: R documentation files. Ignored by git
- `output/`: Output files. The presentation html file used by GitHub Pages is here
- `R/`: R Project package functions
- `Rmd/`: Rmd files. The presentation Rmd file is here
- `.gitignore`: List files that git should ignore
- `.lintr`: [`{lintr}`](https://github.com/jimhester/lintr) files. Used for linting
- `.Rbuildignore`: List files that R project package should ignore during building
- `DESCRIPTION`: R project package meta file
- `LICENSE`: License file
- `makefile`: List useful commands. You can use them on terminal with `make <command_name>`
- `NAMESPACE`: R project package exports. Ignored by git
- `README.md`: Must read file. This very file you are reading
- `render.R`: Run this script to render the presentation
