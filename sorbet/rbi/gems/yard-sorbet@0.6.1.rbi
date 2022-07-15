# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `yard-sorbet` gem.
# Please instead update this file by running `bin/tapioca gem yard-sorbet`.

class YARD::Handlers::Ruby::ClassHandler < ::YARD::Handlers::Ruby::Base
  include ::YARDSorbet::Handlers::StructClassHandler
end

# Types are documentation
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/version.rb:5
module YARDSorbet; end

# Extract & re-add directives to a docstring
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/directives.rb:6
module YARDSorbet::Directives
  class << self
    # source://yard-sorbet-0.6.1/lib/yard-sorbet/directives.rb:24
    sig { params(docstring: ::String, directives: T::Array[::String]).void }
    def add_directives(docstring, directives); end

    # source://yard-sorbet-0.6.1/lib/yard-sorbet/directives.rb:10
    sig { params(docstring: T.nilable(::String)).returns([::YARD::Docstring, T::Array[::String]]) }
    def extract_directives(docstring); end
  end
end

# Custom YARD Handlers
#
# @see https://rubydoc.info/gems/yard/YARD/Handlers/Base YARD Base Handler documentation
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers.rb:7
module YARDSorbet::Handlers; end

# Apllies an `@abstract` tag to `abstract!`/`interface!` modules (if not alerady present).
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/abstract_dsl_handler.rb:7
class YARDSorbet::Handlers::AbstractDSLHandler < ::YARD::Handlers::Ruby::Base
  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/abstract_dsl_handler.rb:21
  sig { void }
  def process; end
end

# Extra text for class namespaces
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/abstract_dsl_handler.rb:18
YARDSorbet::Handlers::AbstractDSLHandler::CLASS_TAG_TEXT = T.let(T.unsafe(nil), String)

# The text accompanying the `@abstract` tag.
#
# @see https://github.com/lsegal/yard/blob/main/templates/default/docstring/html/abstract.erb The `@abstract` tag template
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/abstract_dsl_handler.rb:16
YARDSorbet::Handlers::AbstractDSLHandler::TAG_TEXT = T.let(T.unsafe(nil), String)

# Handle `enums` calls, registering enum values as constants
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/enums_handler.rb:7
class YARDSorbet::Handlers::EnumsHandler < ::YARD::Handlers::Ruby::Base
  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/enums_handler.rb:14
  sig { void }
  def process; end

  private

  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/enums_handler.rb:29
  sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(T::Boolean) }
  def const_assign_node?(node); end
end

# Extends any modules included via `mixes_in_class_methods`
#
# @see https://sorbet.org/docs/abstract#interfaces-and-the-included-hook Sorbet `mixes_in_class_methods` documentation
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/include_handler.rb:9
class YARDSorbet::Handlers::IncludeHandler < ::YARD::Handlers::Ruby::Base
  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/include_handler.rb:16
  sig { void }
  def process; end

  private

  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/include_handler.rb:30
  sig { returns(::YARD::CodeObjects::NamespaceObject) }
  def included_in; end
end

# Tracks modules that invoke `mixes_in_class_methods` for use in {IncludeHandler}
#
# @see https://sorbet.org/docs/abstract#interfaces-and-the-included-hook Sorbet `mixes_in_class_methods` documentation
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/mixes_in_class_methods_handler.rb:9
class YARDSorbet::Handlers::MixesInClassMethodsHandler < ::YARD::Handlers::Ruby::Base
  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/mixes_in_class_methods_handler.rb:23
  sig { void }
  def process; end

  class << self
    # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/mixes_in_class_methods_handler.rb:18
    sig { params(code_obj: ::String).returns(T.nilable(::String)) }
    def mixed_in_class_methods(code_obj); end
  end
end

# A YARD Handler for Sorbet type declarations
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/sig_handler.rb:7
class YARDSorbet::Handlers::SigHandler < ::YARD::Handlers::Ruby::Base
  # Swap the method definition docstring and the sig docstring.
  # Parse relevant parts of the `sig` and include them as well.
  #
  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/sig_handler.rb:20
  sig { void }
  def process; end

  private

  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/sig_handler.rb:52
  sig do
    params(
      method_node: ::YARD::Parser::Ruby::AstNode,
      node: ::YARD::Parser::Ruby::AstNode,
      docstring: ::YARD::Docstring
    ).void
  end
  def parse_params(method_node, node, docstring); end

  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/sig_handler.rb:64
  sig { params(node: ::YARD::Parser::Ruby::AstNode, docstring: ::YARD::Docstring).void }
  def parse_return(node, docstring); end

  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/sig_handler.rb:32
  sig { params(method_node: ::YARD::Parser::Ruby::AstNode, docstring: ::YARD::Docstring).void }
  def parse_sig(method_node, docstring); end
end

# These node types attached to sigs represent attr_* declarations
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/sig_handler.rb:14
YARDSorbet::Handlers::SigHandler::ATTR_NODE_TYPES = T.let(T.unsafe(nil), Array)

# Class-level handler that folds all `const` and `prop` declarations into the constructor documentation
# this needs to be injected as a module otherwise the default Class handler will overwrite documentation
#
# @note this module is included in `YARD::Handlers::Ruby::ClassHandler`
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/struct_class_handler.rb:10
module YARDSorbet::Handlers::StructClassHandler
  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/struct_class_handler.rb:14
  sig { void }
  def process; end

  private

  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/struct_class_handler.rb:52
  sig do
    params(
      object: ::YARD::CodeObjects::MethodObject,
      props: T::Array[::YARDSorbet::TStructProp],
      docstring: ::YARD::Docstring,
      directives: T::Array[::String]
    ).void
  end
  def decorate_t_struct_init(object, props, docstring, directives); end

  # Create a virtual `initialize` method with all the `prop`/`const` arguments
  #
  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/struct_class_handler.rb:30
  sig { params(props: T::Array[::YARDSorbet::TStructProp], class_ns: ::YARD::CodeObjects::ClassObject).void }
  def process_t_struct_props(props, class_ns); end

  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/struct_class_handler.rb:62
  sig { params(props: T::Array[::YARDSorbet::TStructProp]).returns(T::Array[[::String, T.nilable(::String)]]) }
  def to_object_parameters(props); end
end

# Handles all `const`/`prop` calls, creating accessor methods, and compiles them for later usage at the class level
# in creating a constructor
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/struct_prop_handler.rb:8
class YARDSorbet::Handlers::StructPropHandler < ::YARD::Handlers::Ruby::Base
  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/struct_prop_handler.rb:15
  sig { void }
  def process; end

  private

  # Add the source and docstring to the method object
  #
  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/struct_prop_handler.rb:28
  sig { params(object: ::YARD::CodeObjects::MethodObject, prop: ::YARDSorbet::TStructProp).void }
  def decorate_object(object, prop); end

  # Get the default prop value
  #
  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/struct_prop_handler.rb:39
  sig { returns(T.nilable(::String)) }
  def default_value; end

  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/struct_prop_handler.rb:45
  sig { params(name: ::String).returns(::YARDSorbet::TStructProp) }
  def make_prop(name); end

  # Register the field explicitly as an attribute.
  # While `const` attributes are immutable, `prop` attributes may be reassigned.
  #
  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/struct_prop_handler.rb:58
  sig { params(object: ::YARD::CodeObjects::MethodObject, name: ::String).void }
  def register_attrs(object, name); end

  # Store the prop for use in the constructor definition
  #
  # source://yard-sorbet-0.6.1/lib/yard-sorbet/handlers/struct_prop_handler.rb:66
  sig { params(prop: ::YARDSorbet::TStructProp).void }
  def update_state(prop); end
end

# Helper methods for working with `YARD` AST Nodes
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/node_utils.rb:6
module YARDSorbet::NodeUtils
  class << self
    # Traverese AST nodes in breadth-first order
    #
    # @note This will skip over some node types.
    # @yield [YARD::Parser::Ruby::AstNode]
    #
    # source://yard-sorbet-0.6.1/lib/yard-sorbet/node_utils.rb:29
    sig do
      params(
        node: ::YARD::Parser::Ruby::AstNode,
        _blk: T.proc.params(n: ::YARD::Parser::Ruby::AstNode).void
      ).void
    end
    def bfs_traverse(node, &_blk); end

    # Gets the node that a sorbet `sig` can be attached do, bypassing visisbility modifiers and the like
    #
    # source://yard-sorbet-0.6.1/lib/yard-sorbet/node_utils.rb:41
    sig do
      params(
        node: ::YARD::Parser::Ruby::AstNode
      ).returns(T.any(::YARD::Parser::Ruby::MethodCallNode, ::YARD::Parser::Ruby::MethodDefinitionNode))
    end
    def get_method_node(node); end

    # Find and return the adjacent node (ascending)
    #
    # @raise [IndexError] if the node does not have an adjacent sibling (ascending)
    #
    # source://yard-sorbet-0.6.1/lib/yard-sorbet/node_utils.rb:55
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(::YARD::Parser::Ruby::AstNode) }
    def sibling_node(node); end
  end
end

# Command node types that can have type signatures
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/node_utils.rb:10
YARDSorbet::NodeUtils::ATTRIBUTE_METHODS = T.let(T.unsafe(nil), Array)

# Node types that can have type signatures
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/node_utils.rb:12
YARDSorbet::NodeUtils::SIGABLE_NODE = T.type_alias { T.any(::YARD::Parser::Ruby::MethodCallNode, ::YARD::Parser::Ruby::MethodDefinitionNode) }

# Skip these method contents during BFS node traversal, they can have their own nested types via `T.Proc`
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/node_utils.rb:16
YARDSorbet::NodeUtils::SKIP_METHOD_CONTENTS = T.let(T.unsafe(nil), Array)

# Translate `sig` type syntax to `YARD` type syntax.
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/sig_to_yard.rb:6
module YARDSorbet::SigToYARD
  class << self
    # @see https://yardoc.org/types.html
    #
    # source://yard-sorbet-0.6.1/lib/yard-sorbet/sig_to_yard.rb:11
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(T::Array[::String]) }
    def convert(node); end

    private

    # source://yard-sorbet-0.6.1/lib/yard-sorbet/sig_to_yard.rb:44
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(::String) }
    def build_generic_type(node); end

    # source://yard-sorbet-0.6.1/lib/yard-sorbet/sig_to_yard.rb:54
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(T::Array[::String]) }
    def convert_aref(node); end

    # source://yard-sorbet-0.6.1/lib/yard-sorbet/sig_to_yard.rb:66
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(T::Array[::String]) }
    def convert_array(node); end

    # source://yard-sorbet-0.6.1/lib/yard-sorbet/sig_to_yard.rb:74
    sig { params(node: ::YARD::Parser::Ruby::MethodCallNode).returns(T::Array[::String]) }
    def convert_call(node); end

    # source://yard-sorbet-0.6.1/lib/yard-sorbet/sig_to_yard.rb:79
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(T::Array[::String]) }
    def convert_collection(node); end

    # source://yard-sorbet-0.6.1/lib/yard-sorbet/sig_to_yard.rb:86
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(T::Array[::String]) }
    def convert_hash(node); end

    # source://yard-sorbet-0.6.1/lib/yard-sorbet/sig_to_yard.rb:94
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(T::Array[::String]) }
    def convert_list(node); end

    # source://yard-sorbet-0.6.1/lib/yard-sorbet/sig_to_yard.rb:17
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(T::Array[::String]) }
    def convert_node(node); end

    # source://yard-sorbet-0.6.1/lib/yard-sorbet/sig_to_yard.rb:26
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(T::Array[::String]) }
    def convert_node_type(node); end

    # source://yard-sorbet-0.6.1/lib/yard-sorbet/sig_to_yard.rb:99
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(T::Array[::String]) }
    def convert_ref(node); end

    # source://yard-sorbet-0.6.1/lib/yard-sorbet/sig_to_yard.rb:113
    sig { params(node: ::YARD::Parser::Ruby::MethodCallNode).returns(T::Array[::String]) }
    def convert_t_method(node); end

    # source://yard-sorbet-0.6.1/lib/yard-sorbet/sig_to_yard.rb:125
    sig { params(node: ::YARD::Parser::Ruby::AstNode).returns(T::Array[::String]) }
    def convert_unknown(node); end
  end
end

# Used to store the details of a `T::Struct` `prop` definition
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/t_struct_prop.rb:6
class YARDSorbet::TStructProp < ::T::Struct
  const :default, T.nilable(::String)
  const :doc, ::String
  const :prop_name, ::String
  const :source, ::String
  const :types, T::Array[::String]

  class << self
    # source://sorbet-runtime-0.5.10160/lib/types/struct.rb:13
    def inherited(s); end
  end
end

# Helper methods for working with `YARD` tags
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/tag_utils.rb:6
module YARDSorbet::TagUtils
  class << self
    # source://yard-sorbet-0.6.1/lib/yard-sorbet/tag_utils.rb:14
    sig do
      params(
        docstring: ::YARD::Docstring,
        tag_name: ::String,
        name: T.nilable(::String)
      ).returns(T.nilable(::YARD::Tags::Tag))
    end
    def find_tag(docstring, tag_name, name); end

    # Create or update a `YARD` tag with type information
    #
    # source://yard-sorbet-0.6.1/lib/yard-sorbet/tag_utils.rb:28
    sig do
      params(
        docstring: ::YARD::Docstring,
        tag_name: ::String,
        types: T.nilable(T::Array[::String]),
        name: T.nilable(::String),
        text: ::String
      ).void
    end
    def upsert_tag(docstring, tag_name, types = T.unsafe(nil), name = T.unsafe(nil), text = T.unsafe(nil)); end
  end
end

# {https://rubygems.org/gems/yard-sorbet Version history}
#
# source://yard-sorbet-0.6.1/lib/yard-sorbet/version.rb:7
YARDSorbet::VERSION = T.let(T.unsafe(nil), String)
