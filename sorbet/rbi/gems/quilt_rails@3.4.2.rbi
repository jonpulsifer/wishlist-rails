# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `quilt_rails` gem.
# Please instead update this file by running `tapioca sync`.

# typed: true

module ActiveSupport
  extend(::ActiveSupport::LazyLoadHooks)
  extend(::ActiveSupport::Autoload)

  def parse_json_times; end
  def parse_json_times=(val); end
  def test_order; end
  def test_order=(val); end

  class << self
    def eager_load!; end
    def escape_html_entities_in_json(*_arg0, &_arg1); end
    def escape_html_entities_in_json=(arg); end
    def gem_version; end
    def json_encoder(*_arg0, &_arg1); end
    def json_encoder=(arg); end
    def parse_json_times; end
    def parse_json_times=(val); end
    def test_order; end
    def test_order=(val); end
    def time_precision(*_arg0, &_arg1); end
    def time_precision=(arg); end
    def to_time_preserves_timezone; end
    def to_time_preserves_timezone=(value); end
    def use_standard_json_time_format(*_arg0, &_arg1); end
    def use_standard_json_time_format=(arg); end
    def utc_to_local_returns_utc_offset_times; end
    def utc_to_local_returns_utc_offset_times=(value); end
    def version; end
  end
end

class ActiveSupport::Reloader < ::ActiveSupport::ExecutionWrapper
  def initialize; end

  def _class_unload_callbacks; end
  def _prepare_callbacks; end
  def _run_class_unload_callbacks(&block); end
  def _run_prepare_callbacks(&block); end
  def check; end
  def check=(_arg0); end
  def check?; end
  def class_unload!(&block); end
  def complete!; end
  def executor; end
  def executor=(_arg0); end
  def executor?; end
  def release_unload_lock!; end
  def require_unload_lock!; end
  def run!; end

  class << self
    def __callbacks; end
    def _class_unload_callbacks; end
    def _class_unload_callbacks=(value); end
    def _prepare_callbacks; end
    def _prepare_callbacks=(value); end
    def after_class_unload(*args, &block); end
    def before_class_unload(*args, &block); end
    def check; end
    def check!; end
    def check=(value); end
    def check?; end
    def executor; end
    def executor=(value); end
    def executor?; end
    def prepare!; end
    def reload!; end
    def reloaded!; end
    def run!; end
    def to_prepare(*args, &block); end
    def wrap; end
  end
end

module Quilt
  class << self
    def configuration; end
    def configure; end
    def logger(*_arg0, &_arg1); end
    def railtie_helpers_paths; end
    def railtie_namespace; end
    def railtie_routes_url_helpers(include_path_helpers = T.unsafe(nil)); end
    def table_name_prefix; end
    def use_relative_model_naming?; end
  end
end

class Quilt::Configuration < ::ActiveSupport::OrderedOptions
  def initialize; end

  def mount?; end
end

class Quilt::Engine < ::Rails::Engine
end

class Quilt::HeaderCsrfStrategy
  def initialize(controller); end

  def handle_unverified_request; end

  private

  def fallback_handler; end
  def same_site?; end
end

Quilt::HeaderCsrfStrategy::HEADER = T.let(T.unsafe(nil), String)

Quilt::HeaderCsrfStrategy::HEADER_VALUE = T.let(T.unsafe(nil), String)

class Quilt::HeaderCsrfStrategy::NoSameSiteHeaderError < ::StandardError
  def initialize; end
end

module Quilt::Logger
  class << self
    def log(string); end
  end
end

module Quilt::Performance
end

class Quilt::Performance::Client
  def initialize(report); end

  def distribution(metric_name, value, tags = T.unsafe(nil)); end
  def on_distribution(&block); end
  def on_event(&block); end
  def on_navigation(&block); end

  private

  def process_report!; end
  def report_events; end
  def report_navigations; end
  def send_conditional_navigation_distributions(navigation, tags); end
  def send_default_navigation_distributions(navigation, tags); end

  class << self
    def send!(report); end
  end
end

class Quilt::Performance::Connection
  def initialize(downlink:, effective_type:, rtt:, type:); end

  def downlink; end
  def downlink=(_arg0); end
  def effective_type; end
  def effective_type=(_arg0); end
  def rtt; end
  def rtt=(_arg0); end
  def type; end
  def type=(_arg0); end

  class << self
    def from_params(params); end
  end
end

class Quilt::Performance::Event
  def initialize(type:, start:, duration:, metadata:); end

  def connection; end
  def connection=(_arg0); end
  def duration; end
  def duration=(_arg0); end
  def has_metadata?; end
  def metadata; end
  def metadata=(_arg0); end
  def metric_name; end
  def start; end
  def start=(_arg0); end
  def type; end
  def type=(_arg0); end
  def value; end

  class << self
    def from_params(params); end
  end
end

Quilt::Performance::Event::TYPE = T.let(T.unsafe(nil), Hash)

class Quilt::Performance::EventMetadata
  def initialize(name:, size:); end

  def has_size?; end
  def name; end
  def name=(_arg0); end
  def size; end
  def size=(_arg0); end

  class << self
    def from_params(params); end
  end
end

Quilt::Performance::LIFECYCLE = T.let(T.unsafe(nil), Hash)

Quilt::Performance::NAVIGATION = T.let(T.unsafe(nil), Hash)

class Quilt::Performance::Navigation
  def initialize(start:, time_to_complete:, target:, result:, events: T.unsafe(nil), metadata: T.unsafe(nil)); end

  def cache_effectiveness; end
  def connection; end
  def connection=(_arg0); end
  def events; end
  def events=(_arg0); end
  def events_by_type(target_type); end
  def events_with_size; end
  def metadata; end
  def metadata=(_arg0); end
  def resource_events; end
  def result; end
  def result=(_arg0); end
  def start; end
  def start=(_arg0); end
  def target; end
  def target=(_arg0); end
  def time_to_complete; end
  def time_to_complete=(_arg0); end
  def time_to_usable; end
  def total_download_size; end
  def total_duration_by_event_type(type); end

  class << self
    def from_params(params); end
  end
end

class Quilt::Performance::NavigationMetadata
  def initialize(index:, supports_detailed_events:, supports_detailed_time:); end

  def has_size?; end
  def index; end
  def index=(_arg0); end
  def supports_detailed_events; end
  def supports_detailed_events=(_arg0); end
  def supports_detailed_time; end
  def supports_detailed_time=(_arg0); end

  class << self
    def from_params(params = T.unsafe(nil)); end
  end
end

class Quilt::Performance::Report
  def initialize(events:, navigations:, connection:); end

  def connection; end
  def connection=(_arg0); end
  def events; end
  def events=(_arg0); end
  def navigations; end
  def navigations=(_arg0); end

  class << self
    def from_params(params); end

    private

    def build_events(events_params, connection:); end
    def build_navigations(navigations_params, connection:); end
  end
end

module Quilt::Performance::Reportable
  def process_report(&block); end

  private

  def normalized_params; end
end

class Quilt::PerformanceReportController < ::ActionController::Base
  include(::Quilt::Performance::Reportable)

  def create; end

  private

  def _layout(lookup_context, formats); end

  class << self
    def __callbacks; end
    def middleware_stack; end
  end
end

module Quilt::ReactRenderable
  include(::ReverseProxy::Controller)

  def render_react(headers: T.unsafe(nil), data: T.unsafe(nil)); end

  private

  def call_proxy(headers, data); end
  def proxy(headers, data); end
end

class Quilt::ReactRenderable::DoNotIntegrationTestError < ::StandardError
  def initialize; end
end

class Quilt::ReactRenderable::ReactServerNoResponseError < ::StandardError
  def initialize(url); end
end

class Quilt::TrustedUiServerCsrfStrategy
  def initialize(controller); end

  def handle_unverified_request; end

  private

  def fallback_handler; end
  def node_server_side_render?; end
end

class Quilt::UiController < ::ApplicationController
  include(::ReverseProxy::Controller)
  include(::Quilt::ReactRenderable)

  def execution_count; end
  def index; end

  private

  def _layout(lookup_context, formats); end

  class << self
    def _layout; end
    def _layout_conditions; end
    def middleware_stack; end
  end
end

Quilt::VERSION = T.let(T.unsafe(nil), String)