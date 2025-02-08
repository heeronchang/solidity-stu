{

    function cleanup_t_bool(value) -> cleaned {
        cleaned := iszero(iszero(value))
    }

    function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
        mstore(pos, cleanup_t_bool(value))
    }

    function abi_encode_tuple_t_bool__to_t_bool__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

    }

    function allocate_unbounded() -> memPtr {
        memPtr := mload(64)
    }

    function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
        revert(0, 0)
    }

    function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
        revert(0, 0)
    }

    function cleanup_t_uint256(value) -> cleaned {
        cleaned := value
    }

    function validator_revert_t_uint256(value) {
        if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
    }

    function abi_decode_t_uint256_fromMemory(offset, end) -> value {
        value := mload(offset)
        validator_revert_t_uint256(value)
    }

    function abi_decode_tuple_t_uint256_fromMemory(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
        }

    }

    function cleanup_t_uint160(value) -> cleaned {
        cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
    }

    function cleanup_t_address(value) -> cleaned {
        cleaned := cleanup_t_uint160(value)
    }

    function abi_encode_t_address_to_t_address_fromStack(value, pos) {
        mstore(pos, cleanup_t_address(value))
    }

    function abi_encode_tuple_t_address__to_t_address__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

    }

    function array_length_t_array$_t_bytes32_$dyn_storage(value) -> length {

        length := sload(value)

    }

    function array_storeLengthForEncoding_t_array$_t_bytes32_$dyn_memory_ptr_fromStack(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function array_dataslot_t_array$_t_bytes32_$dyn_storage(ptr) -> data {
        data := ptr

        mstore(0, ptr)
        data := keccak256(0, 0x20)

    }

    function cleanup_t_bytes32(value) -> cleaned {
        cleaned := value
    }

    function abi_encode_t_bytes32_to_t_bytes32(value, pos) {
        mstore(pos, cleanup_t_bytes32(value))
    }

    function abi_encodeUpdatedPos_t_bytes32_to_t_bytes32(value0, pos) -> updatedPos {
        abi_encode_t_bytes32_to_t_bytes32(value0, pos)
        updatedPos := add(pos, 0x20)
    }

    function shift_right_0_unsigned(value) -> newValue {
        newValue :=

        shr(0, value)

    }

    function cleanup_from_storage_t_bytes32(value) -> cleaned {
        cleaned := value
    }

    function extract_from_storage_value_offset_0t_bytes32(slot_value) -> value {
        value := cleanup_from_storage_t_bytes32(shift_right_0_unsigned(slot_value))
    }

    function read_from_storage_offset_0_t_bytes32(slot) -> value {
        value := extract_from_storage_value_offset_0t_bytes32(sload(slot))

    }

    function array_nextElement_t_array$_t_bytes32_$dyn_storage(ptr) -> next {
        next := add(ptr, 0x01)
    }

    // bytes32[] -> bytes32[]
    function abi_encode_t_array$_t_bytes32_$dyn_storage_to_t_array$_t_bytes32_$dyn_memory_ptr_fromStack(value, pos)  -> end  {
        let length := array_length_t_array$_t_bytes32_$dyn_storage(value)
        pos := array_storeLengthForEncoding_t_array$_t_bytes32_$dyn_memory_ptr_fromStack(pos, length)
        let baseRef := array_dataslot_t_array$_t_bytes32_$dyn_storage(value)
        let srcPtr := baseRef
        for { let i := 0 } lt(i, length) { i := add(i, 1) }
        {
            let elementValue0 := read_from_storage_offset_0_t_bytes32(srcPtr)
            pos := abi_encodeUpdatedPos_t_bytes32_to_t_bytes32(elementValue0, pos)
            srcPtr := array_nextElement_t_array$_t_bytes32_$dyn_storage(srcPtr)
        }
        end := pos
    }

    function abi_encode_tuple_t_array$_t_bytes32_$dyn_storage__to_t_array$_t_bytes32_$dyn_memory_ptr__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_array$_t_bytes32_$dyn_storage_to_t_array$_t_bytes32_$dyn_memory_ptr_fromStack(value0,  tail)

    }

    function cleanup_t_rational_0_by_1(value) -> cleaned {
        cleaned := value
    }

    function identity(value) -> ret {
        ret := value
    }

    function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
        converted := cleanup_t_uint256(identity(cleanup_t_rational_0_by_1(value)))
    }

    function abi_encode_t_rational_0_by_1_to_t_uint256_fromStack(value, pos) {
        mstore(pos, convert_t_rational_0_by_1_to_t_uint256(value))
    }

    function abi_encode_tuple_t_rational_0_by_1__to_t_uint256__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_rational_0_by_1_to_t_uint256_fromStack(value0,  add(headStart, 0))

    }

    function abi_encode_t_uint256_to_t_uint256_fromStack_library(value, pos) {
        mstore(pos, cleanup_t_uint256(value))
    }

    function array_storeLengthForEncoding_t_string_memory_ptr_fromStack_library(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function store_literal_in_memory_25f45ce586eb78cde7fcdbcae61fb894722d038b7e11980d539030009c6562e9(memPtr) {

        mstore(add(memPtr, 0), "proposal at index 0 should be th")

        mstore(add(memPtr, 32), "e winning proposal")

    }

    function abi_encode_t_stringliteral_25f45ce586eb78cde7fcdbcae61fb894722d038b7e11980d539030009c6562e9_to_t_string_memory_ptr_fromStack_library(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack_library(pos, 50)
        store_literal_in_memory_25f45ce586eb78cde7fcdbcae61fb894722d038b7e11980d539030009c6562e9(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_uint256_t_uint256_t_stringliteral_25f45ce586eb78cde7fcdbcae61fb894722d038b7e11980d539030009c6562e9__to_t_uint256_t_uint256_t_string_memory_ptr__fromStack_library_reversed(headStart , value1, value0) -> tail {
        tail := add(headStart, 96)

        abi_encode_t_uint256_to_t_uint256_fromStack_library(value0,  add(headStart, 0))

        abi_encode_t_uint256_to_t_uint256_fromStack_library(value1,  add(headStart, 32))

        mstore(add(headStart, 64), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_25f45ce586eb78cde7fcdbcae61fb894722d038b7e11980d539030009c6562e9_to_t_string_memory_ptr_fromStack_library( tail)

    }

    function validator_revert_t_bool(value) {
        if iszero(eq(value, cleanup_t_bool(value))) { revert(0, 0) }
    }

    function abi_decode_t_bool_fromMemory(offset, end) -> value {
        value := mload(offset)
        validator_revert_t_bool(value)
    }

    function abi_decode_tuple_t_bool_fromMemory(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_bool_fromMemory(add(headStart, offset), dataEnd)
        }

    }

    function validator_revert_t_bytes32(value) {
        if iszero(eq(value, cleanup_t_bytes32(value))) { revert(0, 0) }
    }

    function abi_decode_t_bytes32_fromMemory(offset, end) -> value {
        value := mload(offset)
        validator_revert_t_bytes32(value)
    }

    function abi_decode_tuple_t_bytes32_fromMemory(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_bytes32_fromMemory(add(headStart, offset), dataEnd)
        }

    }

    function abi_encode_t_bytes32_to_t_bytes32_fromStack_library(value, pos) {
        mstore(pos, cleanup_t_bytes32(value))
    }

    function store_literal_in_memory_9d0a036e342752e0d6e8cbc4347e24a3292eb90ba73a22c6e51429d5bd6c9d72(memPtr) {

        mstore(add(memPtr, 0), "candidate1 should be the winner ")

        mstore(add(memPtr, 32), "name")

    }

    function abi_encode_t_stringliteral_9d0a036e342752e0d6e8cbc4347e24a3292eb90ba73a22c6e51429d5bd6c9d72_to_t_string_memory_ptr_fromStack_library(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack_library(pos, 36)
        store_literal_in_memory_9d0a036e342752e0d6e8cbc4347e24a3292eb90ba73a22c6e51429d5bd6c9d72(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_bytes32_t_bytes32_t_stringliteral_9d0a036e342752e0d6e8cbc4347e24a3292eb90ba73a22c6e51429d5bd6c9d72__to_t_bytes32_t_bytes32_t_string_memory_ptr__fromStack_library_reversed(headStart , value1, value0) -> tail {
        tail := add(headStart, 96)

        abi_encode_t_bytes32_to_t_bytes32_fromStack_library(value0,  add(headStart, 0))

        abi_encode_t_bytes32_to_t_bytes32_fromStack_library(value1,  add(headStart, 32))

        mstore(add(headStart, 64), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_9d0a036e342752e0d6e8cbc4347e24a3292eb90ba73a22c6e51429d5bd6c9d72_to_t_string_memory_ptr_fromStack_library( tail)

    }

    function array_length_t_string_memory_ptr(value) -> length {

        length := mload(value)

    }

    function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function copy_memory_to_memory_with_cleanup(src, dst, length) {

        mcopy(dst, src, length)
        mstore(add(dst, length), 0)

    }

    function round_up_to_mul_of_32(value) -> result {
        result := and(add(value, 31), not(31))
    }

    function abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value, pos) -> end {
        let length := array_length_t_string_memory_ptr(value)
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length)
        copy_memory_to_memory_with_cleanup(add(value, 0x20), pos, length)
        end := add(pos, round_up_to_mul_of_32(length))
    }

    function abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value0,  tail)

    }

    function panic_error_0x51() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x51)
        revert(0, 0x24)
    }

}
