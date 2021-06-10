# Helper to check if the finalizer mode should be used.
# If true or unset, use finalizer mode.
# If false, use regular mode (usage requirement propagation via associated Qt module)
function(__qt_internal_check_finalizer_mode target out_var finalizer)
    get_target_property(value ${target} _qt_${finalizer}_finalizer_mode)
    if("${value}" STREQUAL "value-NOTFOUND")
        __qt_internal_enable_finalizer_mode(${target} ${finalizer} "TRUE")
        set(value "TRUE")
    endif()
    set(${out_var} "${value}" PARENT_SCOPE)
endfunction()

function(__qt_internal_enable_finalizer_mode target finalizer enabled)
    if(enabled)
        set(enabled "TRUE")
    else()
        set(enabled "FALSE")
    endif()
    set_property(TARGET "${target}" PROPERTY _qt_${finalizer}_finalizer_mode "${enabled}")
endfunction()
