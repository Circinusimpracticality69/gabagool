const ALPHABET: &[u8; 64] = b"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

pub fn encode(data: &[u8]) -> String {
    let mut out = String::with_capacity(data.len().div_ceil(3) * 4);
    for chunk in data.chunks(3) {
        let b0 = chunk[0] as u32;
        let b1 = if chunk.len() > 1 { chunk[1] as u32 } else { 0 };
        let b2 = if chunk.len() > 2 { chunk[2] as u32 } else { 0 };
        let triple = (b0 << 16) | (b1 << 8) | b2;

        out.push(ALPHABET[(triple >> 18) as usize & 0x3F] as char);
        out.push(ALPHABET[(triple >> 12) as usize & 0x3F] as char);
        if chunk.len() > 1 {
            out.push(ALPHABET[(triple >> 6) as usize & 0x3F] as char);
        } else {
            out.push('=');
        }
        if chunk.len() > 2 {
            out.push(ALPHABET[triple as usize & 0x3F] as char);
        } else {
            out.push('=');
        }
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;
    use base64::Engine;

    fn roundtrip(data: &[u8]) {
        let ours = encode(data);
        let reference = base64::engine::general_purpose::STANDARD.encode(data);
        assert_eq!(ours, reference, "mismatch for input of len {}", data.len());

        let decoded = base64::engine::general_purpose::STANDARD
            .decode(&ours)
            .unwrap();
        assert_eq!(decoded, data);
    }

    #[test]
    fn test_empty() {
        roundtrip(&[]);
    }

    #[test]
    fn test_padding() {
        roundtrip(&[0x61]);
        roundtrip(&[0x61, 0x62]);
        roundtrip(&[0x61, 0x62, 0x63]);
    }

    #[test]
    fn test_various_lengths() {
        for len in 0..=256 {
            let data: Vec<u8> = (0..len).map(|i| i as u8).collect();
            roundtrip(&data);
        }
    }
}
