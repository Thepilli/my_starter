// To parse this JSON data, do
//
//     final PokemonDetail = pokemonFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_detail_riverpod.freezed.dart';
part 'pokemon_detail_riverpod.g.dart';

PokemonDetail pokemonFromJson(String str) => PokemonDetail.fromJson(json.decode(str));

String pokemonToJson(PokemonDetail data) => json.encode(data.toJson());

@freezed
class PokemonDetail with _$PokemonDetail {
  const factory PokemonDetail({
    @JsonKey(name: "abilities") List<Ability>? abilities,
    @JsonKey(name: "base_experience") int? baseExperience,
    @JsonKey(name: "forms") List<Species>? forms,
    @JsonKey(name: "game_indices") List<GameIndex>? gameIndices,
    @JsonKey(name: "height") int? height,
    @JsonKey(name: "held_items") List<HeldItem>? heldItems,
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "is_default") bool? isDefault,
    @JsonKey(name: "location_area_encounters") String? locationAreaEncounters,
    @JsonKey(name: "moves") List<Move>? moves,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "order") int? order,
    @JsonKey(name: "past_types") List<dynamic>? pastTypes,
    @JsonKey(name: "species") Species? species,
    @JsonKey(name: "sprites") Sprites? sprites,
    @JsonKey(name: "stats") List<Stat>? stats,
    @JsonKey(name: "types") List<Type>? types,
    @JsonKey(name: "weight") int? weight,
  }) = _PokemonDetail;

  factory PokemonDetail.fromJson(Map<String, dynamic> json) => _$PokemonDetailFromJson(json);
}

@freezed
class Ability with _$Ability {
  const factory Ability({
    @JsonKey(name: "ability") Species? ability,
    @JsonKey(name: "is_hidden") bool? isHidden,
    @JsonKey(name: "slot") int? slot,
  }) = _Ability;

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);
}

@freezed
class Species with _$Species {
  const factory Species({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "url") String? url,
  }) = _Species;

  factory Species.fromJson(Map<String, dynamic> json) => _$SpeciesFromJson(json);
}

@freezed
class GameIndex with _$GameIndex {
  const factory GameIndex({
    @JsonKey(name: "game_index") int? gameIndex,
    @JsonKey(name: "version") Species? version,
  }) = _GameIndex;

  factory GameIndex.fromJson(Map<String, dynamic> json) => _$GameIndexFromJson(json);
}

@freezed
class HeldItem with _$HeldItem {
  const factory HeldItem({
    @JsonKey(name: "item") Species? item,
    @JsonKey(name: "version_details") List<VersionDetail>? versionDetails,
  }) = _HeldItem;

  factory HeldItem.fromJson(Map<String, dynamic> json) => _$HeldItemFromJson(json);
}

@freezed
class VersionDetail with _$VersionDetail {
  const factory VersionDetail({
    @JsonKey(name: "rarity") int? rarity,
    @JsonKey(name: "version") Species? version,
  }) = _VersionDetail;

  factory VersionDetail.fromJson(Map<String, dynamic> json) => _$VersionDetailFromJson(json);
}

@freezed
class Move with _$Move {
  const factory Move({
    @JsonKey(name: "move") Species? move,
    @JsonKey(name: "version_group_details") List<VersionGroupDetail>? versionGroupDetails,
  }) = _Move;

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
}

@freezed
class VersionGroupDetail with _$VersionGroupDetail {
  const factory VersionGroupDetail({
    @JsonKey(name: "level_learned_at") int? levelLearnedAt,
    @JsonKey(name: "move_learn_method") Species? moveLearnMethod,
    @JsonKey(name: "version_group") Species? versionGroup,
  }) = _VersionGroupDetail;

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) => _$VersionGroupDetailFromJson(json);
}

@freezed
class Sprites with _$Sprites {
  const factory Sprites({
    @JsonKey(name: "back_default") String? backDefault,
    @JsonKey(name: "back_female") String? backFemale,
    @JsonKey(name: "back_shiny") String? backShiny,
    @JsonKey(name: "back_shiny_female") String? backShinyFemale,
    @JsonKey(name: "front_default") String? frontDefault,
    @JsonKey(name: "front_female") String? frontFemale,
    @JsonKey(name: "front_shiny") String? frontShiny,
    @JsonKey(name: "front_shiny_female") String? frontShinyFemale,
    @JsonKey(name: "other") Other? other,
    @JsonKey(name: "versions") Versions? versions,
  }) = _Sprites;

  factory Sprites.fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);
}

@freezed
class Other with _$Other {
  const factory Other({
    @JsonKey(name: "dream_world") DreamWorld? dreamWorld,
    @JsonKey(name: "home") Home? home,
    @JsonKey(name: "official-artwork") OfficialArtwork? officialArtwork,
  }) = _Other;

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);
}

@freezed
class DreamWorld with _$DreamWorld {
  const factory DreamWorld({
    @JsonKey(name: "front_default") String? frontDefault,
    @JsonKey(name: "front_female") dynamic frontFemale,
  }) = _DreamWorld;

  factory DreamWorld.fromJson(Map<String, dynamic> json) => _$DreamWorldFromJson(json);
}

@freezed
class Home with _$Home {
  const factory Home({
    @JsonKey(name: "front_default") String? frontDefault,
    @JsonKey(name: "front_female") String? frontFemale,
    @JsonKey(name: "front_shiny") String? frontShiny,
    @JsonKey(name: "front_shiny_female") String? frontShinyFemale,
  }) = _Home;

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);
}

@freezed
class OfficialArtwork with _$OfficialArtwork {
  const factory OfficialArtwork({
    @JsonKey(name: "front_default") String? frontDefault,
    @JsonKey(name: "front_shiny") String? frontShiny,
  }) = _OfficialArtwork;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) => _$OfficialArtworkFromJson(json);
}

@freezed
class Versions with _$Versions {
  const factory Versions({
    @JsonKey(name: "generation-i") GenerationI? generationI,
    @JsonKey(name: "generation-ii") GenerationIi? generationIi,
    @JsonKey(name: "generation-iii") GenerationIii? generationIii,
    @JsonKey(name: "generation-iv") GenerationIv? generationIv,
    @JsonKey(name: "generation-v") GenerationV? generationV,
    @JsonKey(name: "generation-vi") GenerationVi? generationVi,
    @JsonKey(name: "generation-vii") GenerationVii? generationVii,
    @JsonKey(name: "generation-viii") GenerationViii? generationViii,
  }) = _Versions;

  factory Versions.fromJson(Map<String, dynamic> json) => _$VersionsFromJson(json);
}

@freezed
class GenerationI with _$GenerationI {
  const factory GenerationI({
    @JsonKey(name: "red-blue") RedBlue? redBlue,
    @JsonKey(name: "yellow") RedBlue? yellow,
  }) = _GenerationI;

  factory GenerationI.fromJson(Map<String, dynamic> json) => _$GenerationIFromJson(json);
}

@freezed
class RedBlue with _$RedBlue {
  const factory RedBlue({
    @JsonKey(name: "back_default") String? backDefault,
    @JsonKey(name: "back_gray") String? backGray,
    @JsonKey(name: "back_transparent") String? backTransparent,
    @JsonKey(name: "front_default") String? frontDefault,
    @JsonKey(name: "front_gray") String? frontGray,
    @JsonKey(name: "front_transparent") String? frontTransparent,
  }) = _RedBlue;

  factory RedBlue.fromJson(Map<String, dynamic> json) => _$RedBlueFromJson(json);
}

@freezed
class GenerationIi with _$GenerationIi {
  const factory GenerationIi({
    @JsonKey(name: "crystal") Crystal? crystal,
    @JsonKey(name: "gold") Gold? gold,
    @JsonKey(name: "silver") Gold? silver,
  }) = _GenerationIi;

  factory GenerationIi.fromJson(Map<String, dynamic> json) => _$GenerationIiFromJson(json);
}

@freezed
class Crystal with _$Crystal {
  const factory Crystal({
    @JsonKey(name: "back_default") String? backDefault,
    @JsonKey(name: "back_shiny") String? backShiny,
    @JsonKey(name: "back_shiny_transparent") String? backShinyTransparent,
    @JsonKey(name: "back_transparent") String? backTransparent,
    @JsonKey(name: "front_default") String? frontDefault,
    @JsonKey(name: "front_shiny") String? frontShiny,
    @JsonKey(name: "front_shiny_transparent") String? frontShinyTransparent,
    @JsonKey(name: "front_transparent") String? frontTransparent,
  }) = _Crystal;

  factory Crystal.fromJson(Map<String, dynamic> json) => _$CrystalFromJson(json);
}

@freezed
class Gold with _$Gold {
  const factory Gold({
    @JsonKey(name: "back_default") String? backDefault,
    @JsonKey(name: "back_shiny") String? backShiny,
    @JsonKey(name: "front_default") String? frontDefault,
    @JsonKey(name: "front_shiny") String? frontShiny,
    @JsonKey(name: "front_transparent") String? frontTransparent,
  }) = _Gold;

  factory Gold.fromJson(Map<String, dynamic> json) => _$GoldFromJson(json);
}

@freezed
class GenerationIii with _$GenerationIii {
  const factory GenerationIii({
    @JsonKey(name: "emerald") OfficialArtwork? emerald,
    @JsonKey(name: "firered-leafgreen") FireredLeafgreen? fireredLeafgreen,
    @JsonKey(name: "ruby-sapphire") FireredLeafgreen? rubySapphire,
  }) = _GenerationIii;

  factory GenerationIii.fromJson(Map<String, dynamic> json) => _$GenerationIiiFromJson(json);
}

@freezed
class FireredLeafgreen with _$FireredLeafgreen {
  const factory FireredLeafgreen({
    @JsonKey(name: "back_default") String? backDefault,
    @JsonKey(name: "back_shiny") String? backShiny,
    @JsonKey(name: "front_default") String? frontDefault,
    @JsonKey(name: "front_shiny") String? frontShiny,
  }) = _FireredLeafgreen;

  factory FireredLeafgreen.fromJson(Map<String, dynamic> json) => _$FireredLeafgreenFromJson(json);
}

@freezed
class GenerationIv with _$GenerationIv {
  const factory GenerationIv({
    @JsonKey(name: "diamond-pearl") DiamondPearl? diamondPearl,
    @JsonKey(name: "heartgold-soulsilver") DiamondPearl? heartgoldSoulsilver,
    @JsonKey(name: "platinum") DiamondPearl? platinum,
  }) = _GenerationIv;

  factory GenerationIv.fromJson(Map<String, dynamic> json) => _$GenerationIvFromJson(json);
}

@freezed
class DiamondPearl with _$DiamondPearl {
  const factory DiamondPearl({
    @JsonKey(name: "back_default") String? backDefault,
    @JsonKey(name: "back_female") String? backFemale,
    @JsonKey(name: "back_shiny") String? backShiny,
    @JsonKey(name: "back_shiny_female") String? backShinyFemale,
    @JsonKey(name: "front_default") String? frontDefault,
    @JsonKey(name: "front_female") String? frontFemale,
    @JsonKey(name: "front_shiny") String? frontShiny,
    @JsonKey(name: "front_shiny_female") String? frontShinyFemale,
  }) = _DiamondPearl;

  factory DiamondPearl.fromJson(Map<String, dynamic> json) => _$DiamondPearlFromJson(json);
}

@freezed
class GenerationV with _$GenerationV {
  const factory GenerationV({
    @JsonKey(name: "black-white") BlackWhite? blackWhite,
  }) = _GenerationV;

  factory GenerationV.fromJson(Map<String, dynamic> json) => _$GenerationVFromJson(json);
}

@freezed
class BlackWhite with _$BlackWhite {
  const factory BlackWhite({
    @JsonKey(name: "animated") Animated? animated,
    @JsonKey(name: "back_default") String? backDefault,
    @JsonKey(name: "back_female") String? backFemale,
    @JsonKey(name: "back_shiny") String? backShiny,
    @JsonKey(name: "back_shiny_female") String? backShinyFemale,
    @JsonKey(name: "front_default") String? frontDefault,
    @JsonKey(name: "front_female") String? frontFemale,
    @JsonKey(name: "front_shiny") String? frontShiny,
    @JsonKey(name: "front_shiny_female") String? frontShinyFemale,
  }) = _BlackWhite;

  factory BlackWhite.fromJson(Map<String, dynamic> json) => _$BlackWhiteFromJson(json);
}

@freezed
class Animated with _$Animated {
  const factory Animated({
    @JsonKey(name: "back_default") String? backDefault,
    @JsonKey(name: "back_female") String? backFemale,
    @JsonKey(name: "back_shiny") String? backShiny,
    @JsonKey(name: "back_shiny_female") String? backShinyFemale,
    @JsonKey(name: "front_default") String? frontDefault,
    @JsonKey(name: "front_female") String? frontFemale,
    @JsonKey(name: "front_shiny") String? frontShiny,
    @JsonKey(name: "front_shiny_female") String? frontShinyFemale,
  }) = _Animated;

  factory Animated.fromJson(Map<String, dynamic> json) => _$AnimatedFromJson(json);
}

@freezed
class GenerationVi with _$GenerationVi {
  const factory GenerationVi({
    @JsonKey(name: "omegaruby-alphasapphire") Home? omegarubyAlphasapphire,
    @JsonKey(name: "x-y") Home? xY,
  }) = _GenerationVi;

  factory GenerationVi.fromJson(Map<String, dynamic> json) => _$GenerationViFromJson(json);
}

@freezed
class GenerationVii with _$GenerationVii {
  const factory GenerationVii({
    @JsonKey(name: "icons") GenerationViiIcons? icons,
    @JsonKey(name: "ultra-sun-ultra-moon") Home? ultraSunUltraMoon,
  }) = _GenerationVii;

  factory GenerationVii.fromJson(Map<String, dynamic> json) => _$GenerationViiFromJson(json);
}

@freezed
class GenerationViiIcons with _$GenerationViiIcons {
  const factory GenerationViiIcons({
    @JsonKey(name: "front_default") String? frontDefault,
    @JsonKey(name: "front_female") dynamic frontFemale,
  }) = _GenerationViiIcons;

  factory GenerationViiIcons.fromJson(Map<String, dynamic> json) => _$GenerationViiIconsFromJson(json);
}

@freezed
class GenerationViii with _$GenerationViii {
  const factory GenerationViii({
    @JsonKey(name: "icons") GenerationViiiIcons? icons,
  }) = _GenerationViii;

  factory GenerationViii.fromJson(Map<String, dynamic> json) => _$GenerationViiiFromJson(json);
}

@freezed
class GenerationViiiIcons with _$GenerationViiiIcons {
  const factory GenerationViiiIcons({
    @JsonKey(name: "front_default") String? frontDefault,
    @JsonKey(name: "front_female") String? frontFemale,
  }) = _GenerationViiiIcons;

  factory GenerationViiiIcons.fromJson(Map<String, dynamic> json) => _$GenerationViiiIconsFromJson(json);
}

@freezed
class Stat with _$Stat {
  const factory Stat({
    @JsonKey(name: "base_stat") int? baseStat,
    @JsonKey(name: "effort") int? effort,
    @JsonKey(name: "stat") Species? stat,
  }) = _Stat;

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
}

@freezed
class Type with _$Type {
  const factory Type({
    @JsonKey(name: "slot") int? slot,
    @JsonKey(name: "type") Species? type,
  }) = _Type;

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
}
