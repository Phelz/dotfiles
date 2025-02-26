SHELL := /bin/bash

# * Usage: Run 'make setup' and provide the PROJECT_NAME and PYTHON_VERSION as inputs

# * Variables (set during runtime)
PROJECTS_DIR   := $(HOME)/projects
PROJECT_NAME   := $(shell read -p "Enter project name: " project_name; echo $$project_name)
PYTHON_VERSION := $(shell read -p "Enter Python version (e.g., 3.9): " python_version; echo $$python_version)

PROJECT_DIR := $(PROJECTS_DIR)/$(PROJECT_NAME)
ENV_YML := environment.yml
MPL_STYLESHEETS_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))mpl_stylesheets

.PHONY: setup init_dir init_git create_env activate_env link_stylesheets

setup: init_dir init_git create_env activate_env link_stylesheets message

init_dir:
	@echo "Initializing project at $(PROJECT_DIR)..."
	@mkdir -p $(PROJECT_DIR)/src
	@echo "# $(PROJECT_NAME)" > $(PROJECT_DIR)/README.md

	@echo "Copying default project files..."
	@cp definitions.py $(PROJECT_DIR)/src/definitions.py
	@cp -r .gitignore $(PROJECT_DIR)/.gitignore
	@mkdir -p $(PROJECT_DIR)/data
	@echo "import pathlib\n\nDIR_PATH = pathlib.Path(__file__).parent" > $(PROJECT_DIR)/data/__init__.py
	@mkdir -p $(PROJECT_DIR)/figures
	@echo "import pathlib\n\nDIR_PATH = pathlib.Path(__file__).parent" > $(PROJECT_DIR)/figures/__init__.py
	
	@echo "Copying default environment.yml template..."
	@cp $(ENV_YML) $(PROJECT_DIR)/$(ENV_YML)
	@sed -i "s/<PROJECT_NAME>/$(PROJECT_NAME)/" $(PROJECT_DIR)/$(ENV_YML)
	@sed -i "s/<PYTHON_VERSION>/$(PYTHON_VERSION)/" $(PROJECT_DIR)/$(ENV_YML)
	@chmod -R 755 $(PROJECT_DIR)

init_git:
	@echo "Initializing Git repository in $(PROJECT_DIR)..."
	@cd $(PROJECT_DIR) && git init -b main

create_env:
	@echo "Creating Conda environment $(PROJECT_NAME)..."
	@conda env create -f $(PROJECT_DIR)/$(ENV_YML)

activate_env:
	@echo "Activating the environment and registering the project..."
	@source $(HOME)/anaconda3/bin/activate $(PROJECT_NAME) && conda develop $(PROJECT_DIR)
	@echo "export MPLSTYLEPATH=$(PROJECT_DIR)/mpl_stylesheets" >> $(HOME)/anaconda3/envs/$(PROJECT_NAME)/etc/conda/activate.d/env_vars.sh


link_stylesheets:
	@echo "Creating symlink for Matplotlib stylesheets..."
	@ln -sfn $(MPL_STYLESHEETS_DIR) $(PROJECT_DIR)/mpl_stylesheets

message:
	@echo "===================================================================="
	@echo "Project $(PROJECT_NAME) initialized in $(PROJECT_DIR)."
	@echo "Git repository initialized with 'main' branch."
	@echo "Conda environment activated, and project registered for development."
	@echo "Activate the environment with: 'conda activate $(PROJECT_NAME)'"
	@echo "===================================================================="