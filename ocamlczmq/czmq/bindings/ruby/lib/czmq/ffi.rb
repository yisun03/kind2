################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################

require 'ffi'
require_relative 'ffi/version'

module CZMQ
  module FFI
    module LibC
      extend ::FFI::Library
      ffi_lib ::FFI::Platform::LIBC
      attach_function :free, [ :pointer ], :void, blocking: true
    end

    extend ::FFI::Library

    def self.available?
      @available
    end

    begin
      lib_name = 'libczmq'
      lib_paths = ['/usr/local/lib', '/opt/local/lib', '/usr/lib64']
        .map { |path| "#{path}/#{lib_name}.#{::FFI::Platform::LIBSUFFIX}" }
      ffi_lib lib_paths + [lib_name]
      @available = true
    rescue LoadError
      warn ""
      warn "WARNING: ::CZMQ::FFI is not available without libczmq."
      warn ""
      @available = false
    end

    if available?
      opts = {
        blocking: true  # only necessary on MRI to deal with the GIL.
      }

      attach_function :zactor_new, [:pointer, :pointer], :pointer, **opts
      attach_function :zactor_destroy, [:pointer], :void, **opts
      attach_function :zactor_send, [:pointer, :pointer], :int, **opts
      attach_function :zactor_recv, [:pointer], :pointer, **opts
      attach_function :zactor_is, [:pointer], :bool, **opts
      attach_function :zactor_resolve, [:pointer], :pointer, **opts
      attach_function :zactor_sock, [:pointer], :pointer, **opts
      attach_function :zactor_test, [:bool], :void, **opts

      require_relative 'ffi/zactor'

      enum :zarmour_mode, [
        :mode_base64_std, 0,
        :mode_base64_url, 1,
        :mode_base32_std, 2,
        :mode_base32_hex, 3,
        :mode_base16, 4,
        :mode_z85, 5,
      ]

      attach_function :zarmour_new, [], :pointer, **opts
      attach_function :zarmour_destroy, [:pointer], :void, **opts
      attach_function :zarmour_mode_str, [:pointer], :string, **opts
      attach_function :zarmour_encode, [:pointer, :pointer, :size_t], :pointer, **opts
      attach_function :zarmour_decode, [:pointer, :string, :pointer], :pointer, **opts
      attach_function :zarmour_mode, [:pointer], :zarmour_mode, **opts
      attach_function :zarmour_set_mode, [:pointer, :zarmour_mode], :void, **opts
      attach_function :zarmour_pad, [:pointer], :bool, **opts
      attach_function :zarmour_set_pad, [:pointer, :bool], :void, **opts
      attach_function :zarmour_pad_char, [:pointer], :pointer, **opts
      attach_function :zarmour_set_pad_char, [:pointer, :pointer], :void, **opts
      attach_function :zarmour_line_breaks, [:pointer], :bool, **opts
      attach_function :zarmour_set_line_breaks, [:pointer, :bool], :void, **opts
      attach_function :zarmour_line_length, [:pointer], :size_t, **opts
      attach_function :zarmour_set_line_length, [:pointer, :size_t], :void, **opts
      attach_function :zarmour_print, [:pointer], :void, **opts
      attach_function :zarmour_test, [:bool], :void, **opts

      require_relative 'ffi/zarmour'

      attach_function :zcert_new, [], :pointer, **opts
      attach_function :zcert_new_from, [:pointer, :pointer], :pointer, **opts
      attach_function :zcert_load, [:string], :pointer, **opts
      attach_function :zcert_destroy, [:pointer], :void, **opts
      attach_function :zcert_public_key, [:pointer], :pointer, **opts
      attach_function :zcert_secret_key, [:pointer], :pointer, **opts
      attach_function :zcert_public_txt, [:pointer], :pointer, **opts
      attach_function :zcert_secret_txt, [:pointer], :pointer, **opts
      attach_function :zcert_set_meta, [:pointer, :string, :string, :varargs], :void, **opts
      attach_function :zcert_meta, [:pointer, :string], :pointer, **opts
      attach_function :zcert_meta_keys, [:pointer], :pointer, **opts
      attach_function :zcert_save, [:pointer, :string], :int, **opts
      attach_function :zcert_save_public, [:pointer, :string], :int, **opts
      attach_function :zcert_save_secret, [:pointer, :string], :int, **opts
      attach_function :zcert_apply, [:pointer, :pointer], :void, **opts
      attach_function :zcert_dup, [:pointer], :pointer, **opts
      attach_function :zcert_eq, [:pointer, :pointer], :bool, **opts
      attach_function :zcert_print, [:pointer], :void, **opts
      attach_function :zcert_fprint, [:pointer, :pointer], :void, **opts
      attach_function :zcert_test, [:bool], :void, **opts

      require_relative 'ffi/zcert'

      attach_function :zcertstore_new, [:string], :pointer, **opts
      attach_function :zcertstore_destroy, [:pointer], :void, **opts
      attach_function :zcertstore_lookup, [:pointer, :string], :pointer, **opts
      attach_function :zcertstore_insert, [:pointer, :pointer], :void, **opts
      attach_function :zcertstore_print, [:pointer], :void, **opts
      attach_function :zcertstore_fprint, [:pointer, :pointer], :void, **opts
      attach_function :zcertstore_test, [:bool], :void, **opts

      require_relative 'ffi/zcertstore'

      attach_function :zconfig_new, [:string, :pointer], :pointer, **opts
      attach_function :zconfig_load, [:string], :pointer, **opts
      attach_function :zconfig_loadf, [:string, :varargs], :pointer, **opts
      attach_function :zconfig_destroy, [:pointer], :void, **opts
      attach_function :zconfig_name, [:pointer], :pointer, **opts
      attach_function :zconfig_value, [:pointer], :pointer, **opts
      attach_function :zconfig_put, [:pointer, :string, :string], :void, **opts
      attach_function :zconfig_putf, [:pointer, :string, :string, :varargs], :void, **opts
      attach_function :zconfig_get, [:pointer, :string, :string], :pointer, **opts
      attach_function :zconfig_set_name, [:pointer, :string], :void, **opts
      attach_function :zconfig_set_value, [:pointer, :string, :varargs], :void, **opts
      attach_function :zconfig_child, [:pointer], :pointer, **opts
      attach_function :zconfig_next, [:pointer], :pointer, **opts
      attach_function :zconfig_locate, [:pointer, :string], :pointer, **opts
      attach_function :zconfig_at_depth, [:pointer, :int], :pointer, **opts
      attach_function :zconfig_execute, [:pointer, :pointer, :pointer], :int, **opts
      attach_function :zconfig_set_comment, [:pointer, :string, :varargs], :void, **opts
      attach_function :zconfig_comments, [:pointer], :pointer, **opts
      attach_function :zconfig_save, [:pointer, :string], :int, **opts
      attach_function :zconfig_savef, [:pointer, :string, :varargs], :int, **opts
      attach_function :zconfig_filename, [:pointer], :string, **opts
      attach_function :zconfig_reload, [:pointer], :int, **opts
      attach_function :zconfig_chunk_load, [:pointer], :pointer, **opts
      attach_function :zconfig_chunk_save, [:pointer], :pointer, **opts
      attach_function :zconfig_str_load, [:string], :pointer, **opts
      attach_function :zconfig_str_save, [:pointer], :pointer, **opts
      attach_function :zconfig_has_changed, [:pointer], :bool, **opts
      attach_function :zconfig_fprint, [:pointer, :pointer], :void, **opts
      attach_function :zconfig_print, [:pointer], :void, **opts
      attach_function :zconfig_test, [:bool], :void, **opts

      require_relative 'ffi/zconfig'

      attach_function :zdir_new, [:string, :string], :pointer, **opts
      attach_function :zdir_destroy, [:pointer], :void, **opts
      attach_function :zdir_path, [:pointer], :string, **opts
      attach_function :zdir_modified, [:pointer], :pointer, **opts
      attach_function :zdir_cursize, [:pointer], :pointer, **opts
      attach_function :zdir_count, [:pointer], :size_t, **opts
      attach_function :zdir_list, [:pointer], :pointer, **opts
      attach_function :zdir_remove, [:pointer, :bool], :void, **opts
      attach_function :zdir_diff, [:pointer, :pointer, :string], :pointer, **opts
      attach_function :zdir_resync, [:pointer, :string], :pointer, **opts
      attach_function :zdir_cache, [:pointer], :pointer, **opts
      attach_function :zdir_fprint, [:pointer, :pointer, :int], :void, **opts
      attach_function :zdir_print, [:pointer, :int], :void, **opts
      attach_function :zdir_watch, [:pointer, :pointer], :void, **opts
      attach_function :zdir_test, [:bool], :void, **opts

      require_relative 'ffi/zdir'

      enum :zdir_patch_op, [
        :create, 1,
        :delete, 2,
      ]

      attach_function :zdir_patch_new, [:string, :pointer, :zdir_patch_op, :string], :pointer, **opts
      attach_function :zdir_patch_destroy, [:pointer], :void, **opts
      attach_function :zdir_patch_dup, [:pointer], :pointer, **opts
      attach_function :zdir_patch_path, [:pointer], :string, **opts
      attach_function :zdir_patch_file, [:pointer], :pointer, **opts
      attach_function :zdir_patch_op, [:pointer], :zdir_patch_op, **opts
      attach_function :zdir_patch_vpath, [:pointer], :string, **opts
      attach_function :zdir_patch_digest_set, [:pointer], :void, **opts
      attach_function :zdir_patch_digest, [:pointer], :string, **opts
      attach_function :zdir_patch_test, [:bool], :void, **opts

      require_relative 'ffi/zdir_patch'

      attach_function :zfile_new, [:string, :string], :pointer, **opts
      attach_function :zfile_destroy, [:pointer], :void, **opts
      attach_function :zfile_dup, [:pointer], :pointer, **opts
      attach_function :zfile_filename, [:pointer, :string], :string, **opts
      attach_function :zfile_restat, [:pointer], :void, **opts
      attach_function :zfile_modified, [:pointer], :pointer, **opts
      attach_function :zfile_cursize, [:pointer], :pointer, **opts
      attach_function :zfile_is_directory, [:pointer], :bool, **opts
      attach_function :zfile_is_regular, [:pointer], :bool, **opts
      attach_function :zfile_is_readable, [:pointer], :bool, **opts
      attach_function :zfile_is_writeable, [:pointer], :bool, **opts
      attach_function :zfile_is_stable, [:pointer], :bool, **opts
      attach_function :zfile_has_changed, [:pointer], :bool, **opts
      attach_function :zfile_remove, [:pointer], :void, **opts
      attach_function :zfile_input, [:pointer], :int, **opts
      attach_function :zfile_output, [:pointer], :int, **opts
      attach_function :zfile_read, [:pointer, :size_t, :pointer], :pointer, **opts
      attach_function :zfile_eof, [:pointer], :bool, **opts
      attach_function :zfile_write, [:pointer, :pointer, :pointer], :int, **opts
      attach_function :zfile_readln, [:pointer], :string, **opts
      attach_function :zfile_close, [:pointer], :void, **opts
      attach_function :zfile_handle, [:pointer], :pointer, **opts
      attach_function :zfile_digest, [:pointer], :string, **opts
      attach_function :zfile_test, [:bool], :void, **opts

      require_relative 'ffi/zfile'

      attach_function :zframe_new, [:pointer, :size_t], :pointer, **opts
      attach_function :zframe_new_empty, [], :pointer, **opts
      attach_function :zframe_from, [:string], :pointer, **opts
      attach_function :zframe_recv, [:pointer], :pointer, **opts
      attach_function :zframe_destroy, [:pointer], :void, **opts
      attach_function :zframe_send, [:pointer, :pointer, :int], :int, **opts
      attach_function :zframe_size, [:pointer], :size_t, **opts
      attach_function :zframe_data, [:pointer], :pointer, **opts
      attach_function :zframe_dup, [:pointer], :pointer, **opts
      attach_function :zframe_strhex, [:pointer], :pointer, **opts
      attach_function :zframe_strdup, [:pointer], :pointer, **opts
      attach_function :zframe_streq, [:pointer, :string], :bool, **opts
      attach_function :zframe_more, [:pointer], :int, **opts
      attach_function :zframe_set_more, [:pointer, :int], :void, **opts
      attach_function :zframe_routing_id, [:pointer], :uint32, **opts
      attach_function :zframe_set_routing_id, [:pointer, :uint32], :void, **opts
      attach_function :zframe_eq, [:pointer, :pointer], :bool, **opts
      attach_function :zframe_reset, [:pointer, :pointer, :size_t], :void, **opts
      attach_function :zframe_print, [:pointer, :string], :void, **opts
      attach_function :zframe_is, [:pointer], :bool, **opts
      attach_function :zframe_test, [:bool], :void, **opts

      require_relative 'ffi/zframe'

      attach_function :zhash_new, [], :pointer, **opts
      attach_function :zhash_unpack, [:pointer], :pointer, **opts
      attach_function :zhash_destroy, [:pointer], :void, **opts
      attach_function :zhash_insert, [:pointer, :string, :pointer], :int, **opts
      attach_function :zhash_update, [:pointer, :string, :pointer], :void, **opts
      attach_function :zhash_delete, [:pointer, :string], :void, **opts
      attach_function :zhash_lookup, [:pointer, :string], :pointer, **opts
      attach_function :zhash_rename, [:pointer, :string, :string], :int, **opts
      attach_function :zhash_freefn, [:pointer, :string, :pointer], :pointer, **opts
      attach_function :zhash_size, [:pointer], :size_t, **opts
      attach_function :zhash_dup, [:pointer], :pointer, **opts
      attach_function :zhash_keys, [:pointer], :pointer, **opts
      attach_function :zhash_first, [:pointer], :pointer, **opts
      attach_function :zhash_next, [:pointer], :pointer, **opts
      attach_function :zhash_cursor, [:pointer], :string, **opts
      attach_function :zhash_comment, [:pointer, :string, :varargs], :void, **opts
      attach_function :zhash_pack, [:pointer], :pointer, **opts
      attach_function :zhash_save, [:pointer, :string], :int, **opts
      attach_function :zhash_load, [:pointer, :string], :int, **opts
      attach_function :zhash_refresh, [:pointer], :int, **opts
      attach_function :zhash_autofree, [:pointer], :void, **opts
      attach_function :zhash_foreach, [:pointer, :pointer, :pointer], :int, **opts
      attach_function :zhash_test, [:bool], :void, **opts

      require_relative 'ffi/zhash'

      attach_function :zhashx_new, [], :pointer, **opts
      attach_function :zhashx_unpack, [:pointer], :pointer, **opts
      attach_function :zhashx_destroy, [:pointer], :void, **opts
      attach_function :zhashx_insert, [:pointer, :pointer, :pointer], :int, **opts
      attach_function :zhashx_update, [:pointer, :pointer, :pointer], :void, **opts
      attach_function :zhashx_delete, [:pointer, :pointer], :void, **opts
      attach_function :zhashx_purge, [:pointer], :void, **opts
      attach_function :zhashx_lookup, [:pointer, :pointer], :pointer, **opts
      attach_function :zhashx_rename, [:pointer, :pointer, :pointer], :int, **opts
      attach_function :zhashx_freefn, [:pointer, :pointer, :pointer], :pointer, **opts
      attach_function :zhashx_size, [:pointer], :size_t, **opts
      attach_function :zhashx_keys, [:pointer], :pointer, **opts
      attach_function :zhashx_values, [:pointer], :pointer, **opts
      attach_function :zhashx_first, [:pointer], :pointer, **opts
      attach_function :zhashx_next, [:pointer], :pointer, **opts
      attach_function :zhashx_cursor, [:pointer], :pointer, **opts
      attach_function :zhashx_comment, [:pointer, :string, :varargs], :void, **opts
      attach_function :zhashx_save, [:pointer, :string], :int, **opts
      attach_function :zhashx_load, [:pointer, :string], :int, **opts
      attach_function :zhashx_refresh, [:pointer], :int, **opts
      attach_function :zhashx_pack, [:pointer], :pointer, **opts
      attach_function :zhashx_dup, [:pointer], :pointer, **opts
      attach_function :zhashx_set_destructor, [:pointer, :pointer], :void, **opts
      attach_function :zhashx_set_duplicator, [:pointer, :pointer], :void, **opts
      attach_function :zhashx_set_key_destructor, [:pointer, :pointer], :void, **opts
      attach_function :zhashx_set_key_duplicator, [:pointer, :pointer], :void, **opts
      attach_function :zhashx_set_key_comparator, [:pointer, :pointer], :void, **opts
      attach_function :zhashx_set_key_hasher, [:pointer, :pointer], :void, **opts
      attach_function :zhashx_dup_v2, [:pointer], :pointer, **opts
      attach_function :zhashx_autofree, [:pointer], :void, **opts
      attach_function :zhashx_foreach, [:pointer, :pointer, :pointer], :int, **opts
      attach_function :zhashx_test, [:bool], :void, **opts

      require_relative 'ffi/zhashx'

      attach_function :ziflist_new, [], :pointer, **opts
      attach_function :ziflist_destroy, [:pointer], :void, **opts
      attach_function :ziflist_reload, [:pointer], :void, **opts
      attach_function :ziflist_size, [:pointer], :size_t, **opts
      attach_function :ziflist_first, [:pointer], :string, **opts
      attach_function :ziflist_next, [:pointer], :string, **opts
      attach_function :ziflist_address, [:pointer], :string, **opts
      attach_function :ziflist_broadcast, [:pointer], :string, **opts
      attach_function :ziflist_netmask, [:pointer], :string, **opts
      attach_function :ziflist_print, [:pointer], :void, **opts
      attach_function :ziflist_test, [:bool], :void, **opts

      require_relative 'ffi/ziflist'

      attach_function :zlist_new, [], :pointer, **opts
      attach_function :zlist_destroy, [:pointer], :void, **opts
      attach_function :zlist_first, [:pointer], :pointer, **opts
      attach_function :zlist_next, [:pointer], :pointer, **opts
      attach_function :zlist_last, [:pointer], :pointer, **opts
      attach_function :zlist_head, [:pointer], :pointer, **opts
      attach_function :zlist_tail, [:pointer], :pointer, **opts
      attach_function :zlist_item, [:pointer], :pointer, **opts
      attach_function :zlist_append, [:pointer, :pointer], :int, **opts
      attach_function :zlist_push, [:pointer, :pointer], :int, **opts
      attach_function :zlist_pop, [:pointer], :pointer, **opts
      attach_function :zlist_exists, [:pointer, :pointer], :bool, **opts
      attach_function :zlist_remove, [:pointer, :pointer], :void, **opts
      attach_function :zlist_dup, [:pointer], :pointer, **opts
      attach_function :zlist_purge, [:pointer], :void, **opts
      attach_function :zlist_size, [:pointer], :size_t, **opts
      attach_function :zlist_sort, [:pointer, :pointer], :void, **opts
      attach_function :zlist_autofree, [:pointer], :void, **opts
      attach_function :zlist_comparefn, [:pointer, :pointer], :void, **opts
      attach_function :zlist_freefn, [:pointer, :pointer, :pointer, :bool], :pointer, **opts
      attach_function :zlist_test, [:bool], :void, **opts

      require_relative 'ffi/zlist'

      attach_function :zloop_new, [], :pointer, **opts
      attach_function :zloop_destroy, [:pointer], :void, **opts
      attach_function :zloop_reader, [:pointer, :pointer, :pointer, :pointer], :int, **opts
      attach_function :zloop_reader_end, [:pointer, :pointer], :void, **opts
      attach_function :zloop_reader_set_tolerant, [:pointer, :pointer], :void, **opts
      attach_function :zloop_poller, [:pointer, :pointer, :pointer, :pointer], :int, **opts
      attach_function :zloop_poller_end, [:pointer, :pointer], :void, **opts
      attach_function :zloop_poller_set_tolerant, [:pointer, :pointer], :void, **opts
      attach_function :zloop_timer, [:pointer, :size_t, :size_t, :pointer, :pointer], :int, **opts
      attach_function :zloop_timer_end, [:pointer, :int], :int, **opts
      attach_function :zloop_ticket, [:pointer, :pointer, :pointer], :pointer, **opts
      attach_function :zloop_ticket_reset, [:pointer, :pointer], :void, **opts
      attach_function :zloop_ticket_delete, [:pointer, :pointer], :void, **opts
      attach_function :zloop_set_ticket_delay, [:pointer, :size_t], :void, **opts
      attach_function :zloop_set_max_timers, [:pointer, :size_t], :void, **opts
      attach_function :zloop_set_verbose, [:pointer, :bool], :void, **opts
      attach_function :zloop_start, [:pointer], :int, **opts
      attach_function :zloop_ignore_interrupts, [:pointer], :void, **opts
      attach_function :zloop_test, [:bool], :void, **opts

      require_relative 'ffi/zloop'

      attach_function :zmsg_new, [], :pointer, **opts
      attach_function :zmsg_recv, [:pointer], :pointer, **opts
      attach_function :zmsg_load, [:pointer], :pointer, **opts
      attach_function :zmsg_decode, [:pointer, :size_t], :pointer, **opts
      attach_function :zmsg_new_signal, [:char], :pointer, **opts
      attach_function :zmsg_destroy, [:pointer], :void, **opts
      attach_function :zmsg_send, [:pointer, :pointer], :int, **opts
      attach_function :zmsg_sendm, [:pointer, :pointer], :int, **opts
      attach_function :zmsg_size, [:pointer], :size_t, **opts
      attach_function :zmsg_content_size, [:pointer], :size_t, **opts
      attach_function :zmsg_routing_id, [:pointer], :uint32, **opts
      attach_function :zmsg_set_routing_id, [:pointer, :uint32], :void, **opts
      attach_function :zmsg_prepend, [:pointer, :pointer], :int, **opts
      attach_function :zmsg_append, [:pointer, :pointer], :int, **opts
      attach_function :zmsg_pop, [:pointer], :pointer, **opts
      attach_function :zmsg_pushmem, [:pointer, :pointer, :size_t], :int, **opts
      attach_function :zmsg_addmem, [:pointer, :pointer, :size_t], :int, **opts
      attach_function :zmsg_pushstr, [:pointer, :string], :int, **opts
      attach_function :zmsg_addstr, [:pointer, :string], :int, **opts
      attach_function :zmsg_pushstrf, [:pointer, :string, :varargs], :int, **opts
      attach_function :zmsg_addstrf, [:pointer, :string, :varargs], :int, **opts
      attach_function :zmsg_popstr, [:pointer], :pointer, **opts
      attach_function :zmsg_addmsg, [:pointer, :pointer], :int, **opts
      attach_function :zmsg_popmsg, [:pointer], :pointer, **opts
      attach_function :zmsg_remove, [:pointer, :pointer], :void, **opts
      attach_function :zmsg_first, [:pointer], :pointer, **opts
      attach_function :zmsg_next, [:pointer], :pointer, **opts
      attach_function :zmsg_last, [:pointer], :pointer, **opts
      attach_function :zmsg_save, [:pointer, :pointer], :int, **opts
      attach_function :zmsg_encode, [:pointer, :pointer], :size_t, **opts
      attach_function :zmsg_dup, [:pointer], :pointer, **opts
      attach_function :zmsg_print, [:pointer], :void, **opts
      attach_function :zmsg_eq, [:pointer, :pointer], :bool, **opts
      attach_function :zmsg_signal, [:pointer], :int, **opts
      attach_function :zmsg_is, [:pointer], :bool, **opts
      attach_function :zmsg_test, [:bool], :void, **opts

      require_relative 'ffi/zmsg'

      attach_function :zpoller_new, [:pointer, :varargs], :pointer, **opts
      attach_function :zpoller_destroy, [:pointer], :void, **opts
      attach_function :zpoller_add, [:pointer, :pointer], :int, **opts
      attach_function :zpoller_remove, [:pointer, :pointer], :int, **opts
      attach_function :zpoller_wait, [:pointer, :int], :pointer, **opts
      attach_function :zpoller_expired, [:pointer], :bool, **opts
      attach_function :zpoller_terminated, [:pointer], :bool, **opts
      attach_function :zpoller_ignore_interrupts, [:pointer], :void, **opts
      attach_function :zpoller_test, [:bool], :void, **opts

      require_relative 'ffi/zpoller'

      attach_function :zsock_new, [:int], :pointer, **opts
      attach_function :zsock_new_pub, [:string], :pointer, **opts
      attach_function :zsock_new_sub, [:string, :string], :pointer, **opts
      attach_function :zsock_new_req, [:string], :pointer, **opts
      attach_function :zsock_new_rep, [:string], :pointer, **opts
      attach_function :zsock_new_dealer, [:string], :pointer, **opts
      attach_function :zsock_new_router, [:string], :pointer, **opts
      attach_function :zsock_new_push, [:string], :pointer, **opts
      attach_function :zsock_new_pull, [:string], :pointer, **opts
      attach_function :zsock_new_xpub, [:string], :pointer, **opts
      attach_function :zsock_new_xsub, [:string], :pointer, **opts
      attach_function :zsock_new_pair, [:string], :pointer, **opts
      attach_function :zsock_new_stream, [:string], :pointer, **opts
      attach_function :zsock_new_server, [:string], :pointer, **opts
      attach_function :zsock_new_client, [:string], :pointer, **opts
      attach_function :zsock_destroy, [:pointer], :void, **opts
      attach_function :zsock_bind, [:pointer, :string, :varargs], :int, **opts
      attach_function :zsock_endpoint, [:pointer], :string, **opts
      attach_function :zsock_unbind, [:pointer, :string, :varargs], :int, **opts
      attach_function :zsock_connect, [:pointer, :string, :varargs], :int, **opts
      attach_function :zsock_disconnect, [:pointer, :string, :varargs], :int, **opts
      attach_function :zsock_attach, [:pointer, :string, :bool], :int, **opts
      attach_function :zsock_type_str, [:pointer], :string, **opts
      attach_function :zsock_send, [:pointer, :string, :varargs], :int, **opts
      attach_function :zsock_vsend, [:pointer, :string, :pointer], :int, **opts
      attach_function :zsock_recv, [:pointer, :string, :varargs], :int, **opts
      attach_function :zsock_vrecv, [:pointer, :string, :pointer], :int, **opts
      attach_function :zsock_bsend, [:pointer, :string, :varargs], :int, **opts
      attach_function :zsock_brecv, [:pointer, :string, :varargs], :int, **opts
      attach_function :zsock_routing_id, [:pointer], :uint32, **opts
      attach_function :zsock_set_routing_id, [:pointer, :uint32], :void, **opts
      attach_function :zsock_set_unbounded, [:pointer], :void, **opts
      attach_function :zsock_signal, [:pointer, :char], :int, **opts
      attach_function :zsock_wait, [:pointer], :int, **opts
      attach_function :zsock_flush, [:pointer], :void, **opts
      attach_function :zsock_is, [:pointer], :bool, **opts
      attach_function :zsock_resolve, [:pointer], :pointer, **opts
      attach_function :zsock_tos, [:pointer], :int, **opts
      attach_function :zsock_set_tos, [:pointer, :int], :void, **opts
      attach_function :zsock_set_router_handover, [:pointer, :int], :void, **opts
      attach_function :zsock_set_router_mandatory, [:pointer, :int], :void, **opts
      attach_function :zsock_set_probe_router, [:pointer, :int], :void, **opts
      attach_function :zsock_set_req_relaxed, [:pointer, :int], :void, **opts
      attach_function :zsock_set_req_correlate, [:pointer, :int], :void, **opts
      attach_function :zsock_set_conflate, [:pointer, :int], :void, **opts
      attach_function :zsock_zap_domain, [:pointer], :pointer, **opts
      attach_function :zsock_set_zap_domain, [:pointer, :string], :void, **opts
      attach_function :zsock_mechanism, [:pointer], :int, **opts
      attach_function :zsock_plain_server, [:pointer], :int, **opts
      attach_function :zsock_set_plain_server, [:pointer, :int], :void, **opts
      attach_function :zsock_plain_username, [:pointer], :pointer, **opts
      attach_function :zsock_set_plain_username, [:pointer, :string], :void, **opts
      attach_function :zsock_plain_password, [:pointer], :pointer, **opts
      attach_function :zsock_set_plain_password, [:pointer, :string], :void, **opts
      attach_function :zsock_curve_server, [:pointer], :int, **opts
      attach_function :zsock_set_curve_server, [:pointer, :int], :void, **opts
      attach_function :zsock_curve_publickey, [:pointer], :pointer, **opts
      attach_function :zsock_set_curve_publickey, [:pointer, :string], :void, **opts
      attach_function :zsock_set_curve_publickey_bin, [:pointer, :pointer], :void, **opts
      attach_function :zsock_curve_secretkey, [:pointer], :pointer, **opts
      attach_function :zsock_set_curve_secretkey, [:pointer, :string], :void, **opts
      attach_function :zsock_set_curve_secretkey_bin, [:pointer, :pointer], :void, **opts
      attach_function :zsock_curve_serverkey, [:pointer], :pointer, **opts
      attach_function :zsock_set_curve_serverkey, [:pointer, :string], :void, **opts
      attach_function :zsock_set_curve_serverkey_bin, [:pointer, :pointer], :void, **opts
      attach_function :zsock_gssapi_server, [:pointer], :int, **opts
      attach_function :zsock_set_gssapi_server, [:pointer, :int], :void, **opts
      attach_function :zsock_gssapi_plaintext, [:pointer], :int, **opts
      attach_function :zsock_set_gssapi_plaintext, [:pointer, :int], :void, **opts
      attach_function :zsock_gssapi_principal, [:pointer], :pointer, **opts
      attach_function :zsock_set_gssapi_principal, [:pointer, :string], :void, **opts
      attach_function :zsock_gssapi_service_principal, [:pointer], :pointer, **opts
      attach_function :zsock_set_gssapi_service_principal, [:pointer, :string], :void, **opts
      attach_function :zsock_ipv6, [:pointer], :int, **opts
      attach_function :zsock_set_ipv6, [:pointer, :int], :void, **opts
      attach_function :zsock_immediate, [:pointer], :int, **opts
      attach_function :zsock_set_immediate, [:pointer, :int], :void, **opts
      attach_function :zsock_set_router_raw, [:pointer, :int], :void, **opts
      attach_function :zsock_ipv4only, [:pointer], :int, **opts
      attach_function :zsock_set_ipv4only, [:pointer, :int], :void, **opts
      attach_function :zsock_set_delay_attach_on_connect, [:pointer, :int], :void, **opts
      attach_function :zsock_type, [:pointer], :int, **opts
      attach_function :zsock_sndhwm, [:pointer], :int, **opts
      attach_function :zsock_set_sndhwm, [:pointer, :int], :void, **opts
      attach_function :zsock_rcvhwm, [:pointer], :int, **opts
      attach_function :zsock_set_rcvhwm, [:pointer, :int], :void, **opts
      attach_function :zsock_affinity, [:pointer], :int, **opts
      attach_function :zsock_set_affinity, [:pointer, :int], :void, **opts
      attach_function :zsock_set_subscribe, [:pointer, :string], :void, **opts
      attach_function :zsock_set_unsubscribe, [:pointer, :string], :void, **opts
      attach_function :zsock_identity, [:pointer], :pointer, **opts
      attach_function :zsock_set_identity, [:pointer, :string], :void, **opts
      attach_function :zsock_rate, [:pointer], :int, **opts
      attach_function :zsock_set_rate, [:pointer, :int], :void, **opts
      attach_function :zsock_recovery_ivl, [:pointer], :int, **opts
      attach_function :zsock_set_recovery_ivl, [:pointer, :int], :void, **opts
      attach_function :zsock_sndbuf, [:pointer], :int, **opts
      attach_function :zsock_set_sndbuf, [:pointer, :int], :void, **opts
      attach_function :zsock_rcvbuf, [:pointer], :int, **opts
      attach_function :zsock_set_rcvbuf, [:pointer, :int], :void, **opts
      attach_function :zsock_linger, [:pointer], :int, **opts
      attach_function :zsock_set_linger, [:pointer, :int], :void, **opts
      attach_function :zsock_reconnect_ivl, [:pointer], :int, **opts
      attach_function :zsock_set_reconnect_ivl, [:pointer, :int], :void, **opts
      attach_function :zsock_reconnect_ivl_max, [:pointer], :int, **opts
      attach_function :zsock_set_reconnect_ivl_max, [:pointer, :int], :void, **opts
      attach_function :zsock_backlog, [:pointer], :int, **opts
      attach_function :zsock_set_backlog, [:pointer, :int], :void, **opts
      attach_function :zsock_maxmsgsize, [:pointer], :int, **opts
      attach_function :zsock_set_maxmsgsize, [:pointer, :int], :void, **opts
      attach_function :zsock_multicast_hops, [:pointer], :int, **opts
      attach_function :zsock_set_multicast_hops, [:pointer, :int], :void, **opts
      attach_function :zsock_rcvtimeo, [:pointer], :int, **opts
      attach_function :zsock_set_rcvtimeo, [:pointer, :int], :void, **opts
      attach_function :zsock_sndtimeo, [:pointer], :int, **opts
      attach_function :zsock_set_sndtimeo, [:pointer, :int], :void, **opts
      attach_function :zsock_set_xpub_verbose, [:pointer, :int], :void, **opts
      attach_function :zsock_tcp_keepalive, [:pointer], :int, **opts
      attach_function :zsock_set_tcp_keepalive, [:pointer, :int], :void, **opts
      attach_function :zsock_tcp_keepalive_idle, [:pointer], :int, **opts
      attach_function :zsock_set_tcp_keepalive_idle, [:pointer, :int], :void, **opts
      attach_function :zsock_tcp_keepalive_cnt, [:pointer], :int, **opts
      attach_function :zsock_set_tcp_keepalive_cnt, [:pointer, :int], :void, **opts
      attach_function :zsock_tcp_keepalive_intvl, [:pointer], :int, **opts
      attach_function :zsock_set_tcp_keepalive_intvl, [:pointer, :int], :void, **opts
      attach_function :zsock_tcp_accept_filter, [:pointer], :pointer, **opts
      attach_function :zsock_set_tcp_accept_filter, [:pointer, :string], :void, **opts
      attach_function :zsock_rcvmore, [:pointer], :int, **opts
      attach_function :zsock_fd, [:pointer], :pointer, **opts
      attach_function :zsock_events, [:pointer], :int, **opts
      attach_function :zsock_last_endpoint, [:pointer], :pointer, **opts
      attach_function :zsock_test, [:bool], :void, **opts

      require_relative 'ffi/zsock'

      attach_function :zstr_recv, [:pointer], :pointer, **opts
      attach_function :zstr_recvx, [:pointer, :pointer, :varargs], :int, **opts
      attach_function :zstr_send, [:pointer, :string], :int, **opts
      attach_function :zstr_sendm, [:pointer, :string], :int, **opts
      attach_function :zstr_sendf, [:pointer, :string, :varargs], :int, **opts
      attach_function :zstr_sendfm, [:pointer, :string, :varargs], :int, **opts
      attach_function :zstr_sendx, [:pointer, :string, :varargs], :int, **opts
      attach_function :zstr_str, [:pointer], :pointer, **opts
      attach_function :zstr_free, [:pointer], :void, **opts
      attach_function :zstr_test, [:bool], :void, **opts

      require_relative 'ffi/zstr'

      attach_function :ztrie_new, [:pointer], :pointer, **opts
      attach_function :ztrie_destroy, [:pointer], :void, **opts
      attach_function :ztrie_insert_route, [:pointer, :string, :pointer, :pointer], :int, **opts
      attach_function :ztrie_remove_route, [:pointer, :string], :int, **opts
      attach_function :ztrie_matches, [:pointer, :string], :bool, **opts
      attach_function :ztrie_hit_data, [:pointer], :pointer, **opts
      attach_function :ztrie_hit_parameter_count, [:pointer], :size_t, **opts
      attach_function :ztrie_hit_parameters, [:pointer], :pointer, **opts
      attach_function :ztrie_hit_asterisk_match, [:pointer], :string, **opts
      attach_function :ztrie_print, [:pointer], :void, **opts
      attach_function :ztrie_test, [:bool], :void, **opts

      require_relative 'ffi/ztrie'

      attach_function :zuuid_new, [], :pointer, **opts
      attach_function :zuuid_new_from, [:pointer], :pointer, **opts
      attach_function :zuuid_destroy, [:pointer], :void, **opts
      attach_function :zuuid_set, [:pointer, :pointer], :void, **opts
      attach_function :zuuid_set_str, [:pointer, :string], :int, **opts
      attach_function :zuuid_data, [:pointer], :pointer, **opts
      attach_function :zuuid_size, [:pointer], :size_t, **opts
      attach_function :zuuid_str, [:pointer], :string, **opts
      attach_function :zuuid_str_canonical, [:pointer], :string, **opts
      attach_function :zuuid_export, [:pointer, :pointer], :void, **opts
      attach_function :zuuid_eq, [:pointer, :pointer], :bool, **opts
      attach_function :zuuid_neq, [:pointer, :pointer], :bool, **opts
      attach_function :zuuid_dup, [:pointer], :pointer, **opts
      attach_function :zuuid_test, [:bool], :void, **opts

      require_relative 'ffi/zuuid'
    end
  end
end

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################