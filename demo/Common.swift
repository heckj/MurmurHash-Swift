//
//  Common.swift
//  MurmurHashDemo
//
//  Created by Daisuke T on 2019/02/14.
//  Copyright © 2019 MurmurHashDemo. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import Cocoa
#endif

import MurmurHash_Swift

class Common {
	
	static func x86_32() {
		print(String(format: "x86_32(\"Hello World!\") -> 0x%02x", MurmurHash3.x86_32("Hello World!")))
		print(String(format: "x86_32(\"Hello World!\", seed: 0x7fffffff) -> 0x%02x", MurmurHash3.x86_32("Hello World!", seed: 0x7fffffff)))
	}
	
	static func x86_32_file() {
		let bundle = Bundle(for: Common.self)
		let path = bundle.path(forResource: "alice29", ofType: "txt")!
		let data = NSData(contentsOfFile: path)! as Data
		
		print(String(format: "x86_32(file) -> 0x%02x", MurmurHash3.x86_32(data)))
		print(String(format: "x86_32(file, seed: 0x7fffffff) -> 0x%02x", MurmurHash3.x86_32(data, seed: 0x7fffffff)))
	}
	
	
	
	static func x86_128() {
		var out = (h1: UInt32(0), h2: UInt32(0), h3: UInt32(0), h4: UInt32(0))
		
		out = MurmurHash3.x86_128("Hello World!")
		print("x86_128(\"Hello World!\") ->")
		print(String(format: "    h1 0x%02x", out.h1))
		print(String(format: "    h2 0x%02x", out.h2))
		print(String(format: "    h3 0x%02x", out.h3))
		print(String(format: "    h4 0x%02x", out.h4))
		
		out = MurmurHash3.x86_128("Hello World!", seed: 0x7fffffff)
		print("x86_128(\"Hello World!\", seed: 0x7fffffff) ->")
		print(String(format: "    h1 0x%02x", out.h1))
		print(String(format: "    h2 0x%02x", out.h2))
		print(String(format: "    h3 0x%02x", out.h3))
		print(String(format: "    h4 0x%02x", out.h4))
	}
	
	static func x86_128_file() {
		let bundle = Bundle(for: Common.self)
		let path = bundle.path(forResource: "alice29", ofType: "txt")!
		let data = NSData(contentsOfFile: path)! as Data
		
		var out = (h1: UInt32(0), h2: UInt32(0), h3: UInt32(0), h4: UInt32(0))
		
		out = MurmurHash3.x86_128(data)
		print("x86_128(file) ->")
		print(String(format: "    h1 0x%02x", out.h1))
		print(String(format: "    h2 0x%02x", out.h2))
		print(String(format: "    h3 0x%02x", out.h3))
		print(String(format: "    h4 0x%02x", out.h4))
		
		out = MurmurHash3.x86_128(data, seed: 0x7fffffff)
		print("x86_128(file, seed: 0x7fffffff) ->")
		print(String(format: "    h1 0x%02x", out.h1))
		print(String(format: "    h2 0x%02x", out.h2))
		print(String(format: "    h3 0x%02x", out.h3))
		print(String(format: "    h4 0x%02x", out.h4))
	}
	
	
	
	static func x64_128() {
		var out = (h1: UInt64(0), h2: UInt64(0))
		
		out = MurmurHash3.x64_128("Hello World!")
		print("x64_128(\"Hello World!\") ->")
		print(String(format: "    h1 0x%02lx", out.h1))
		print(String(format: "    h2 0x%02lx", out.h2))
		
		out = MurmurHash3.x64_128("Hello World!", seed: 0x7fffffff)
		print("x64_128(\"Hello World!\", seed: 0x7fffffff) ->")
		print(String(format: "    h1 0x%02lx", out.h1))
		print(String(format: "    h2 0x%02lx", out.h2))
	}
	
	static func x64_128_file() {
		let bundle = Bundle(for: Common.self)
		let path = bundle.path(forResource: "alice29", ofType: "txt")!
		let data = NSData(contentsOfFile: path)! as Data
		
		var out = (h1: UInt64(0), h2: UInt64(0))
		
		out = MurmurHash3.x64_128(data)
		print("x64_128(file) ->")
		print(String(format: "    h1 0x%02lx", out.h1))
		print(String(format: "    h2 0x%02lx", out.h2))
		
		out = MurmurHash3.x64_128(data, seed: 0x7fffffff)
		print("x64_128(file, seed: 0x7fffffff) ->")
		print(String(format: "    h1 0x%02lx", out.h1))
		print(String(format: "    h2 0x%02lx", out.h2))
	}

}