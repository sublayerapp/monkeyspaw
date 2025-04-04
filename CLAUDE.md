# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands
- `bundle install` - Install gem dependencies
- `bundle exec rake build` - Build the gem
- `bundle exec rake spec` - Run all tests
- `bundle exec rspec spec/monkeyspaw/config_spec.rb` - Run a single test file
- `bundle exec rspec spec/monkeyspaw/config_spec.rb:12` - Run a specific test

## Linting & Style
- Ruby version: >= 3.0
- Follow standard Ruby style conventions:
  - Use 2 spaces for indentation
  - Use snake_case for methods and variables
  - Use CamelCase for classes and modules
  - Place requires at the top of files
  - Group related methods together
  - Add appropriate documentation for public methods
  - Use meaningful variable names
  - Prefer Ruby idioms (e.g., attr_accessor, blocks)
  - Handle errors appropriately with begin/rescue where necessary

## Project Overview
MonkeysPaw is a prompt-driven web framework for Ruby that uses AI to generate web content based on prompts. It's designed to allow users to express web development intentions through prompts rather than code.

## Library Usage
Users of this gem will:
- Create prompt files in their project's `wishes/` directory
- Define components in the `components/` directory
- Initialize the framework with `MonkeysPaw.pick_up!`
- Configure settings with `MonkeysPaw.configure`
- Access generated content through the web server (default: http://localhost:1337)