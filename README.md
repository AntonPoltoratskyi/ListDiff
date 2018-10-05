[![Build Status](https://travis-ci.org/lxcid/ListDiff.svg?branch=master)](https://travis-ci.org/lxcid/ListDiff)

# ListDiff

__ListDiff__ is a Swift port of [IGListKit](https://github.com/Instagram/IGListKit)'s [IGListDiff](https://github.com/Instagram/IGListKit/blob/master/Source/IGListDiff.mm).
It is an implementation of [an algorithm by Paul Heckel](http://dl.acm.org/citation.cfm?id=359467&dl=ACM&coll=DL) that calculates the diff between 2 arrays.

## Motivation

The motivation for this project came from the following [challenge](https://github.com/Instagram/IGListKit/issues/76) which I learnt about it from [Ryan Nystrom](https://twitter.com/_ryannystrom)'s [talk](https://engineers.sg/video/scaling-at-large-lessons-learned-rewriting-instagram-s-feed-ios-conf-sg-2016--1218) at [iOSConf.SG](http://iosconf.sg).

## Getting Started

```bash
swift package generate-xcodeproj
```

## Installation

#### CocoaPods

```ruby
pod 'ListDiff'
```

#### Carthage

```ogdl
github "lxcid/ListDiff" "master"
```

## Usage

```swift
import ListDiff

public protocol Diffable {
    var diffIdentifier: AnyHashable { get }
}

extension Int: Diffable {
    public var diffIdentifier: AnyHashable {
        return self
    }
}
let old = [0, 1, 2]
let new = [2, 1, 3]
let diff = List.diffing(old: old, new: new).forBatchUpdates().

// diff.hasChanges == true
// diff.deletes == IndexSet(integer: 0)
// diff.inserts == IndexSet(integer: 2)
// diff.moves == [List.MoveIndex(from: 2, to: 0), List.MoveIndex(from: 1, to: 1)]
// diff.changeCount == 4

 collectionView.performBatchUpdates({
        if !diff.deletes.isEmpty {
            collectionView.deleteItems(
                at: diff.deletes.map {
                    IndexPath(item: $0, section: 0)
                }
            )
        }
        if !diff.inserts.isEmpty {
            collectionView.insertItems(
                at: diff.inserts.map {
                    IndexPath(item: $0, section: 0)
                }
            )
        }
        for move in diff.moves {
            collectionView.moveItem(
                at: IndexPath(item: move.from, section: 0),
                to: IndexPath(item: move.to, section: 0)
            )
        }
}, completion: nil)
```

## Rationale

During the port, I made several decisions which I would like to rationalize here.

- _Using caseless enum as namespace._ See [Erica Sadun's post here](http://ericasadun.com/2016/07/18/dear-erica-no-case-enums/).
- _No support for index paths._ Decided that this is out of the scope.
- _Stack vs Heap._ AFAIK, Swift does not advocates thinking about stack vs heap allocation model, leaving the optimization decisions to compiler instead. Nevertheless, some of the guideline do favour `struct` more, so only `List.Entry` is a (final) class as we need reference to its instances.

## Alternatives

- [Diff](https://github.com/AndrewSB/Diff) by [Andrew Breckenridge](https://github.com/AndrewSB)
