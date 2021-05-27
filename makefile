.PHONY: install_dependencies
install_dependencies:
	Rscript -e 'install.packages("devtools")'
	Rscript -e 'devtools::install_deps(dependencies = "hard")'

.PHONY: clean
clean:
	find output/ -not -name ".*" -type f -delete

.PHONY: document
document:
	Rscript -e 'devtools::document()'

.PHONY: check
check:
	Rscript -e 'devtools::check()'

.PHONY: install
install:
	Rscript -e 'devtools::install()'

.PHONY: lint
lint:
	Rscript -e 'lintr::lint_package()'

.PHONY: run
run:
	Rscript render.R

.PHONY: all
all: clean document check install lint run
