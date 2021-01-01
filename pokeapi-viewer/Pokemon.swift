//
//  Pokemon.swift
//  pokeapi-viewer
//
//  Created by Luke Lazzaro on 1/1/21.
//

import Foundation

// Base struct
struct Pokemon: Codable {
    let abilities: Array<Ability>
    let baseExperience: Int
    let forms: Array<Form>
    let gameIndices: Array<GameIndex>
    let height: Int
    let heldItems: Array<HeldItem>
    let id: Int
    let isDefault: Bool
    let locationAreaEncounters: String
    let moves: Array<Move>
    let name: String
    let order: Int
    let species: Species
    let sprites: SpriteData
    let stats: Array<Stat>
    let types: Array<Type>
    let weight: Int
}

// Abilities
struct Ability: Codable {
    let ability: AbilityDetail
    let isHidden: Bool
    let slot: Int
}

struct AbilityDetail: Codable {
    let name: String
    let url: String
}

// Forms
struct Form: Codable {
    let name: String
    let url: String
}

// Game indices
struct GameIndex: Codable {
    let gameIndex: Int
    let version: GameVersion
}

struct GameVersion: Codable {
    let name: String
    let url: String
}

// Held items
struct HeldItem: Codable {
    let item: Item
    let versionDetails: Array<GameVersionDetail>
}

struct Item: Codable {
    let name: String
    let url: String
}

struct GameVersionDetail: Codable {
    let rarity: Int
    let version: GameVersion
}

// Moves
struct Move: Codable {
    let move: MoveDetail
    let versionGroupDetails: Array<VersionGroupDetail>
}

struct MoveDetail: Codable {
    let name: String
    let url: String
}

struct VersionGroupDetail: Codable {
    let levelLearnedAt: Int
    let moveLearnMethod: MoveLearnMethod
    let versionGroup: VersionGroup
}

struct MoveLearnMethod: Codable {
    let name: String
    let url: String
}

struct VersionGroup: Codable {
    let name: String
    let url: String
}

// Species
struct Species: Codable {
    let name: String
    let url: String
}

// Sprites
struct SpriteData {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
    let other: OtherSprites
    let versions: VersionSpecificSprites
}

struct OtherSprites: Codable {
    let dreamWorld: DreamWorldSprites
    let officialArtwork: OfficialSprites
}

struct DreamWorldSprites: Codable {
    let frontDefault: String?
    let frontFemale: String?
}

struct OfficialSprites: Codable {
    let frontDefault: String?
}

struct VersionSpecificSprites: Codable {
    let generationI: GenISprites
    let generationII: GenIISprites
    let generationIII: GenIIISprites
    let generationIV: GenIVSprites
    let generationV: GenVSprites
    let generationVI: GenVISprites
    let generationVII: GenVIISprites
    let generationVIII: GenVIIISprites
}

// Gen 1
struct GenISprites: Codable {
    let redBlue: RedBlueSprites
    let yellow: YellowSprites
}

struct RedBlueSprites: Codable {
    let backDefault: String?
    let backGray: String?
    let frontDefault: String?
    let frontGray: String?
}

struct YellowSprites: Codable {
    let backDefault: String?
    let backGray: String?
    let frontDefault: String?
    let frontGray: String?
}

// Gen 2
struct GenIISprites: Codable {
    let crystal: CrystalSprites
    let gold: GoldSprites
    let silver: SilverSprites
}

struct CrystalSprites: Codable {
    let backDefault: String?
    let backShiny: String?
    let frontDefault: String?
    let frontShiny: String?
}

struct GoldSprites: Codable {
    let backDefault: String?
    let backShiny: String?
    let frontDefault: String?
    let frontShiny: String?
}

struct SilverSprites: Codable {
    let backDefault: String?
    let backShiny: String?
    let frontDefault: String?
    let frontShiny: String?
}

// Gen 3
struct GenIIISprites: Codable {
    let emerald: EmeraldSprites
    let fireredLeafgreen: FireredLeafgreenSprites
    let rubySapphire: RubySapphireSprites
}

struct EmeraldSprites: Codable {
    let frontDefault: String?
    let frontShiny: String?
}

struct FireredLeafgreenSprites: Codable {
    let backDefault: String?
    let backShiny: String?
    let frontDefault: String?
    let frontShiny: String?
}

struct RubySapphireSprites: Codable {
    let backDefault: String?
    let backShiny: String?
    let frontDefault: String?
    let frontShiny: String?
}

// Gen 4
struct GenIVSprites: Codable {
    let diamondPearl: DiamondPearlSprites
    let heartgoldSoulsilver: HeartgoldSoulsilverSprites
    let platinum: PlatinumSprites
}

struct DiamondPearlSprites: Codable {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
}

struct HeartgoldSoulsilverSprites: Codable {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
}

struct PlatinumSprites: Codable {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
}

// Gen 5
struct GenVSprites: Codable {
    let blackWhite: BlackWhiteSprites
}

struct BlackWhiteSprites: Codable {
    let animated: AnimatedBlackWhiteSprites
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
}
