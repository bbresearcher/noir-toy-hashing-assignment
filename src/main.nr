use dep::std;

global PRIME: u32 = 16777619;

fn main(value: u32, hash_value: pub u32){
    let calculated_hash_value = calculate_hash(value);

    assert(calculated_hash_value == hash_value);
}

fn calculate_hash(num: u32) -> u32 {
    let mut msize = 2;
    msize = msize.pow_32(32);
    let isize = msize as u48;
    let mut hash_value : u32  = 0x811C9DC5;
    let bytes  = num as Field;
    let nbytes  = bytes.to_be_bytes(4);
    for i in 0..4{
        let product = (hash_value as u48 * PRIME as u48) % isize;
        hash_value = (product as u32 ^ nbytes[i] as u32);
    }
    
    hash_value
}

#[test]
fn test_1() {
    let num: u32 = 127561628;
    let hash = calculate_hash(num);
    
    assert(hash == 0x71233de7);
}

#[test]
fn test_2() {
    let num: u32 = 237261828;
    let hash = calculate_hash(num);
    
    assert(hash == 0x7F51D567);
}

#[test]
fn test_3() {
    let num : u32 = 596214892;
    let hash = calculate_hash(num);

    assert(hash == 0x3F0C8995);
}
