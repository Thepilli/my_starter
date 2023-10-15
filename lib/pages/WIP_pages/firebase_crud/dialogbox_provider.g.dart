// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialogbox_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$textControllerHash() => r'66363a0330a98dd2a32cf820a91ef72e14e0796a';

/// See also [textController].
@ProviderFor(textController)
final textControllerProvider =
    AutoDisposeProvider<TextEditingController>.internal(
  textController,
  name: r'textControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$textControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TextControllerRef = AutoDisposeProviderRef<TextEditingController>;
String _$dialogboxTextHash() => r'ac9c70bd0a488a0db6e2b460f1e242f1a5be0a75';

/// See also [DialogboxText].
@ProviderFor(DialogboxText)
final dialogboxTextProvider =
    AutoDisposeNotifierProvider<DialogboxText, String>.internal(
  DialogboxText.new,
  name: r'dialogboxTextProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dialogboxTextHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DialogboxText = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
