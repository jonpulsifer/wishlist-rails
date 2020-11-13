# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `tapioca` gem.
# Please instead update this file by running `tapioca sync`.

# typed: true

module Tapioca
  class << self
    def silence_warnings(&blk); end
  end
end

class Tapioca::Cli < ::Thor
  include(::Thor::Actions)
  extend(::Thor::Actions::ClassMethods)

  def __print_version; end
  def dsl(*constants); end
  def generate(*gems); end
  def generator; end
  def init; end
  def require; end
  def sync; end
  def todo; end

  class << self
    def exit_on_failure?; end
  end
end

module Tapioca::Compilers
end

module Tapioca::Compilers::Dsl
end

class Tapioca::Compilers::Dsl::Base
  abstract!

  sig { void }
  def initialize; end

  sig { abstract.type_parameters(:T).params(root: Parlour::RbiGenerator::Namespace, constant: T.type_parameter(:T)).void }
  def decorate(root, constant); end
  sig { abstract.returns(T::Enumerable[Module]) }
  def gather_constants; end
  sig { params(constant: Module).returns(T::Boolean) }
  def handles?(constant); end
  sig { returns(T::Set[Module]) }
  def processable_constants; end

  private

  sig { params(method_def: T.any(Method, UnboundMethod)).returns(T::Array[Parlour::RbiGenerator::Parameter]) }
  def compile_method_parameters_to_parlour(method_def); end
  sig { params(method_def: T.any(Method, UnboundMethod)).returns(String) }
  def compile_method_return_type_to_parlour(method_def); end
  sig { params(namespace: Parlour::RbiGenerator::Namespace, name: String, options: T::Hash[T.untyped, T.untyped]).void }
  def create_method(namespace, name, options = T.unsafe(nil)); end
  sig { params(namespace: Parlour::RbiGenerator::Namespace, method_def: T.any(Method, UnboundMethod), class_method: T::Boolean).void }
  def create_method_from_def(namespace, method_def, class_method: T.unsafe(nil)); end
  sig { params(method_def: T.any(Method, UnboundMethod), signature: T.untyped).returns(T::Array[String]) }
  def parameters_types_from_signature(method_def, signature); end
  sig { params(name: String).returns(T::Boolean) }
  def valid_method_name?(name); end
end

Tapioca::Compilers::Dsl::Base::SPECIAL_METHOD_NAMES = T.let(T.unsafe(nil), Array)

class Tapioca::Compilers::DslCompiler
  sig { params(requested_constants: T::Array[Module], requested_generators: T::Array[String], error_handler: T.nilable(T.proc.params(error: String).void)).void }
  def initialize(requested_constants:, requested_generators: T.unsafe(nil), error_handler: T.unsafe(nil)); end

  sig { returns(T.proc.params(error: String).void) }
  def error_handler; end
  sig { returns(T::Enumerable[Tapioca::Compilers::Dsl::Base]) }
  def generators; end
  sig { returns(T::Array[Module]) }
  def requested_constants; end
  sig { params(blk: T.proc.params(constant: Module, rbi: String).void).void }
  def run(&blk); end

  private

  sig { params(requested_constants: T::Array[Module]).returns(T::Set[Module]) }
  def gather_constants(requested_constants); end
  sig { params(requested_generators: T::Array[String]).returns(T::Enumerable[Tapioca::Compilers::Dsl::Base]) }
  def gather_generators(requested_generators); end
  sig { params(requested_generators: T::Array[String]).returns(T.proc.params(klass: Class).returns(T::Boolean)) }
  def generator_filter(requested_generators); end
  sig { params(constant: Module).returns(T.nilable(String)) }
  def rbi_for_constant(constant); end
  sig { params(error: String).returns(T.noreturn) }
  def report_error(error); end
  sig { params(parlour: Parlour::RbiGenerator).void }
  def resolve_conflicts(parlour); end
end

class Tapioca::Compilers::RequiresCompiler
  sig { params(sorbet_path: String).void }
  def initialize(sorbet_path); end

  sig { returns(String) }
  def compile; end

  private

  sig { params(config: Spoom::Sorbet::Config).returns(T::Array[String]) }
  def collect_files(config); end
  sig { params(file_path: String).returns(T::Enumerable[String]) }
  def collect_requires(file_path); end
  sig { params(config: Spoom::Sorbet::Config, file: String).returns(T::Boolean) }
  def file_ignored_by_sorbet?(config, file); end
  sig { params(files: T::Enumerable[String], name: String).returns(T::Boolean) }
  def name_in_project?(files, name); end
end

module Tapioca::Compilers::Sorbet
  class << self
    sig { params(args: String).returns(String) }
    def run(*args); end
    sig { returns(String) }
    def sorbet_path; end
  end
end

Tapioca::Compilers::Sorbet::SORBET = T.let(T.unsafe(nil), Pathname)

module Tapioca::Compilers::SymbolTable
end

class Tapioca::Compilers::SymbolTable::SymbolGenerator
  sig { params(gem: Tapioca::Gemfile::Gem, indent: Integer).void }
  def initialize(gem, indent = T.unsafe(nil)); end

  def gem; end
  sig { returns(String) }
  def generate; end
  def indent; end

  private

  sig { params(name: String).void }
  def add_to_alias_namespace(name); end
  sig { params(name: String).returns(T::Boolean) }
  def alias_namespaced?(name); end
  sig { params(constant: Module, other: BasicObject).returns(T::Boolean) }
  def are_equal?(constant, other); end
  sig { params(constant: BasicObject).returns(Class) }
  def class_of(constant); end
  sig { params(name: T.nilable(String), constant: BasicObject).returns(T.nilable(String)) }
  def compile(name, constant); end
  sig { params(name: String, constant: Module).returns(T.nilable(String)) }
  def compile_alias(name, constant); end
  sig { params(name: String, constant: Module).returns(T.nilable(String)) }
  def compile_body(name, constant); end
  sig { params(name: String, constant: BasicObject).returns(T.nilable(String)) }
  def compile_constant(name, constant); end
  sig { params(module_name: String, mod: Module, for_visibility: T::Array[Symbol]).returns(String) }
  def compile_directly_owned_methods(module_name, mod, for_visibility = T.unsafe(nil)); end
  sig { params(symbol_name: String, constant: Module, method: T.nilable(UnboundMethod)).returns(T.nilable(String)) }
  def compile_method(symbol_name, constant, method); end
  sig { params(name: String, constant: Module).returns(T.nilable(String)) }
  def compile_methods(name, constant); end
  sig { params(constant: Module).returns(String) }
  def compile_mixes_in_class_methods(constant); end
  sig { params(constant: Module).returns(String) }
  def compile_mixins(constant); end
  sig { params(name: String, constant: Module).returns(T.nilable(String)) }
  def compile_module(name, constant); end
  sig { params(constant: Module).returns(String) }
  def compile_module_helpers(constant); end
  sig { params(name: String, value: BasicObject).returns(T.nilable(String)) }
  def compile_object(name, value); end
  sig { params(constant: Module).returns(String) }
  def compile_props(constant); end
  sig { params(signature: T.untyped, parameters: T::Array[[Symbol, String]]).returns(String) }
  def compile_signature(signature, parameters); end
  sig { params(name: String, constant: Module).returns(T.nilable(String)) }
  def compile_subconstants(name, constant); end
  sig { params(constant: Class).returns(String) }
  def compile_superclass(constant); end
  sig { params(constant: Module).returns(T::Array[Symbol]) }
  def constants_of(constant); end
  sig { params(constant: Module, strict: T::Boolean).returns(T::Boolean) }
  def defined_in_gem?(constant, strict: T.unsafe(nil)); end
  sig { params(symbols: T::Set[String]).returns(T::Set[String]) }
  def engine_symbols(symbols); end
  sig { params(symbol: String).returns(T.nilable(String)) }
  def generate_from_symbol(symbol); end
  sig { params(constant: Module).returns(T::Array[String]) }
  def get_file_candidates(constant); end
  sig { params(str: String).returns(String) }
  def indented(str); end
  def initialize_method_for(constant); end
  sig { params(name: String).void }
  def mark_seen(name); end
  sig { params(method: UnboundMethod).returns(T::Boolean) }
  def method_in_gem?(method); end
  sig { params(mod: Module).returns(T::Hash[Symbol, T::Array[Symbol]]) }
  def method_names_by_visibility(mod); end
  sig { params(constant: Module).returns(T.nilable(String)) }
  def name_of(constant); end
  sig { params(constant: Module).returns(T.nilable(String)) }
  def name_of_proxy_target(constant); end
  def parent_declares_constant?(name); end
  sig { params(constant: Module).returns(T::Boolean) }
  def public_module?(constant); end
  sig { params(constant: Module).returns(T.nilable(String)) }
  def qualified_name_of(constant); end
  sig { params(constant: Module).returns(T.nilable(String)) }
  def raw_name_of(constant); end
  sig { params(symbol: String).returns(BasicObject) }
  def resolve_constant(symbol); end
  sig { params(name: String).returns(T::Boolean) }
  def seen?(name); end
  sig { params(method: T.any(Method, UnboundMethod)).returns(T.untyped) }
  def signature_of(method); end
  sig { params(constant: BasicObject).returns(Class) }
  def singleton_class_of(constant); end
  sig { params(constant: Module, method_name: String).returns(T::Boolean) }
  def struct_method?(constant, method_name); end
  sig { params(constant: Class).returns(T.nilable(Class)) }
  def superclass_of(constant); end
  sig { params(symbol_name: String).returns(T::Boolean) }
  def symbol_ignored?(symbol_name); end
  sig { returns(T::Set[String]) }
  def symbols; end
  sig { params(constant: Module).returns(String) }
  def type_of(constant); end
  sig { params(name: String).returns(T::Boolean) }
  def valid_method_name?(name); end
  sig { type_parameters(:U).params(step: Integer, _blk: T.proc.returns(T.type_parameter(:U))).returns(T.type_parameter(:U)) }
  def with_indentation(step = T.unsafe(nil), &_blk); end
end

Tapioca::Compilers::SymbolTable::SymbolGenerator::IGNORED_SYMBOLS = T.let(T.unsafe(nil), Array)

Tapioca::Compilers::SymbolTable::SymbolGenerator::SPECIAL_METHOD_NAMES = T.let(T.unsafe(nil), Array)

Tapioca::Compilers::SymbolTable::SymbolGenerator::TYPE_PARAMETER_MATCHER = T.let(T.unsafe(nil), Regexp)

module Tapioca::Compilers::SymbolTable::SymbolLoader
  class << self
    def ignore_symbol?(symbol); end
    sig { params(paths: T::Array[Pathname]).returns(T::Set[String]) }
    def list_from_paths(paths); end

    private

    def ignored_symbols; end
    sig { params(paths: T::Array[String]).returns(T::Set[String]) }
    def load_symbols(paths); end
    def symbol_table_json_from(input, table_type: T.unsafe(nil)); end
  end
end

class Tapioca::Compilers::SymbolTable::SymbolLoader::SymbolTableParser
  class << self
    def parse(object, parents = T.unsafe(nil)); end
  end
end

class Tapioca::Compilers::SymbolTableCompiler
  sig { params(gem: Tapioca::Gemfile::Gem, indent: Integer).returns(String) }
  def compile(gem, indent = T.unsafe(nil)); end
end

class Tapioca::Compilers::TodosCompiler
  sig { returns(String) }
  def compile; end

  private

  sig { returns(String) }
  def list_todos; end
end

class Tapioca::Config < ::T::Struct
  const :outdir, String
  const :prerequire, T.nilable(String)
  const :postrequire, String
  const :generate_command, String
  const :exclude, T::Array[String]
  const :typed_overrides, T::Hash[String, String]
  const :todos_path, String
  const :generators, T::Array[String]

  sig { returns(Pathname) }
  def outpath; end

  class << self
    def inherited(s); end
  end
end

Tapioca::Config::DEFAULT_DSLDIR = T.let(T.unsafe(nil), String)

Tapioca::Config::DEFAULT_GEMDIR = T.let(T.unsafe(nil), String)

Tapioca::Config::DEFAULT_OVERRIDES = T.let(T.unsafe(nil), Hash)

Tapioca::Config::DEFAULT_POSTREQUIRE = T.let(T.unsafe(nil), String)

Tapioca::Config::DEFAULT_RBIDIR = T.let(T.unsafe(nil), String)

Tapioca::Config::DEFAULT_TODOSPATH = T.let(T.unsafe(nil), String)

Tapioca::Config::SORBET_CONFIG = T.let(T.unsafe(nil), String)

Tapioca::Config::SORBET_PATH = T.let(T.unsafe(nil), String)

Tapioca::Config::TAPIOCA_CONFIG = T.let(T.unsafe(nil), String)

Tapioca::Config::TAPIOCA_PATH = T.let(T.unsafe(nil), String)

class Tapioca::ConfigBuilder
  class << self
    sig { params(command: Symbol, options: T::Hash[String, T.untyped]).returns(Tapioca::Config) }
    def from_options(command, options); end

    private

    sig { returns(T::Hash[String, T.untyped]) }
    def config_options; end
    sig { returns(String) }
    def default_command; end
    sig { params(command: Symbol).returns(T::Hash[String, T.untyped]) }
    def default_options(command); end
    sig { params(options: T::Hash[String, T.untyped]).returns(T::Hash[String, T.untyped]) }
    def merge_options(*options); end
  end
end

Tapioca::ConfigBuilder::DEFAULT_OPTIONS = T.let(T.unsafe(nil), Hash)

module Tapioca::ConstantLocator

  private

  def files_for(klass); end

  class << self
    def files_for(klass); end
  end
end

class Tapioca::Error < ::StandardError
end

class Tapioca::Gemfile
  sig { void }
  def initialize; end

  sig { returns(T::Array[Tapioca::Gemfile::Gem]) }
  def dependencies; end
  sig { params(gem_name: String).returns(T.nilable(Tapioca::Gemfile::Gem)) }
  def gem(gem_name); end
  sig { void }
  def require; end

  private

  sig { returns(Bundler::Definition) }
  def definition; end
  sig { returns(String) }
  def dir; end
  sig { returns(File) }
  def gemfile; end
  sig { returns(T::Array[Symbol]) }
  def groups; end
  def lockfile; end
  sig { returns(Bundler::Runtime) }
  def runtime; end
end

class Tapioca::Gemfile::Gem
  sig { params(spec: T.any(Gem::Specification, T.all(Bundler::RemoteSpecification, Bundler::StubSpecification))).void }
  def initialize(spec); end

  sig { params(path: String).returns(T::Boolean) }
  def contains_path?(path); end
  sig { returns(T::Array[Pathname]) }
  def files; end
  sig { returns(String) }
  def full_gem_path; end
  sig { params(gemfile_dir: String).returns(T::Boolean) }
  def ignore?(gemfile_dir); end
  sig { returns(String) }
  def name; end
  sig { returns(String) }
  def rbi_file_name; end
  def version; end

  private

  sig { returns(T::Boolean) }
  def gem_ignored?; end
  sig { params(gemfile_dir: String).returns(T::Boolean) }
  def gem_in_app_dir?(gemfile_dir); end
  sig { returns(T::Boolean) }
  def gem_in_bundle_path?; end
  sig { params(path: String).returns(T::Boolean) }
  def has_parent_gemspec?(path); end
  sig { params(path: T.any(Pathname, String)).returns(String) }
  def to_realpath(path); end
  sig { returns(String) }
  def version_string; end
end

Tapioca::Gemfile::Gem::IGNORED_GEMS = T.let(T.unsafe(nil), Array)

class Tapioca::Generator < ::Thor::Shell::Color
  sig { params(config: Tapioca::Config).void }
  def initialize(config); end

  sig { params(requested_constants: T::Array[String]).void }
  def build_dsl(requested_constants); end
  sig { params(gem_names: T::Array[String]).void }
  def build_gem_rbis(gem_names); end
  sig { void }
  def build_requires; end
  sig { void }
  def build_todos; end
  sig { returns(Tapioca::Config) }
  def config; end
  sig { void }
  def sync_rbis_with_gemfile; end

  private

  sig { params(filename: Pathname).void }
  def add(filename); end
  sig { returns(T::Array[String]) }
  def added_rbis; end
  sig { returns(Tapioca::Gemfile) }
  def bundle; end
  sig { params(constant: Module, contents: String).void }
  def compile_dsl_rbi(constant, contents); end
  sig { params(gem: Tapioca::Gemfile::Gem).void }
  def compile_gem_rbi(gem); end
  sig { returns(Tapioca::Compilers::SymbolTableCompiler) }
  def compiler; end
  sig { params(constant_names: T::Array[String]).returns(T::Array[Module]) }
  def constantize(constant_names); end
  sig { params(gem_name: String).returns(Pathname) }
  def existing_rbi(gem_name); end
  sig { returns(T::Hash[String, String]) }
  def existing_rbis; end
  sig { params(gem_name: String).returns(Pathname) }
  def expected_rbi(gem_name); end
  sig { returns(T::Hash[String, String]) }
  def expected_rbis; end
  sig { params(file: String, error: LoadError).void }
  def explain_failed_require(file, error); end
  sig { params(gem_name: String).returns(T::Boolean) }
  def gem_rbi_exists?(gem_name); end
  sig { params(gem_name: String, version: String).returns(Pathname) }
  def gem_rbi_filename(gem_name, version); end
  sig { params(gem_names: T::Array[String]).returns(T::Array[Tapioca::Gemfile::Gem]) }
  def gems_to_generate(gem_names); end
  sig { params(eager_load: T::Boolean).void }
  def load_application(eager_load:); end
  sig { void }
  def load_dsl_generators; end
  sig { returns(Tapioca::Loader) }
  def loader; end
  sig { params(old_filename: Pathname, new_filename: Pathname).void }
  def move(old_filename, new_filename); end
  sig { void }
  def perform_additions; end
  sig { void }
  def perform_removals; end
  sig { params(command: String, reason: T.nilable(String), strictness: T.nilable(String)).returns(String) }
  def rbi_header(command, reason: T.unsafe(nil), strictness: T.unsafe(nil)); end
  sig { params(filename: Pathname).void }
  def remove(filename); end
  sig { returns(T::Array[String]) }
  def removed_rbis; end
  sig { void }
  def require_gem_file; end
  sig { params(message: String, color: T.any(Symbol, T::Array[Symbol])).void }
  def say_error(message = T.unsafe(nil), *color); end
end

Tapioca::Generator::EMPTY_RBI_COMMENT = T.let(T.unsafe(nil), String)

class Tapioca::Loader
  sig { params(gemfile: Tapioca::Gemfile).void }
  def initialize(gemfile); end

  sig { params(initialize_file: T.nilable(String), require_file: T.nilable(String)).void }
  def load_bundle(initialize_file, require_file); end
  sig { params(environment_load: T::Boolean, eager_load: T::Boolean).void }
  def load_rails(environment_load: T.unsafe(nil), eager_load: T.unsafe(nil)); end

  private

  sig { void }
  def eager_load_rails_app; end
  sig { returns(Tapioca::Gemfile) }
  def gemfile; end
  sig { void }
  def load_rails_engines; end
  sig { void }
  def load_rake; end
  sig { returns(T::Array[T.untyped]) }
  def rails_engines; end
  sig { void }
  def require_bundle; end
  sig { params(file: T.nilable(String)).void }
  def require_helper(file); end
  sig { params(path: String).void }
  def safe_require(path); end
  sig { void }
  def silence_deprecations; end
end

Tapioca::VERSION = T.let(T.unsafe(nil), String)
