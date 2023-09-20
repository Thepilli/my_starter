// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$eventRepositoryHash() => r'12a9b3d2affe5f0a12b6aca82c8574fbe9c40671';

/// See also [EventRepository].
@ProviderFor(EventRepository)
final eventRepositoryProvider = AutoDisposeNotifierProvider<EventRepository,
    Map<DateTime, List<Event>>>.internal(
  EventRepository.new,
  name: r'eventRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$eventRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EventRepository = AutoDisposeNotifier<Map<DateTime, List<Event>>>;
String _$selectedDateHash() => r'd11ce452fa611414fdcdb752a17ee0c51a2bfbfe';

/// See also [SelectedDate].
@ProviderFor(SelectedDate)
final selectedDateProvider =
    AutoDisposeNotifierProvider<SelectedDate, List<DateTime>>.internal(
  SelectedDate.new,
  name: r'selectedDateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$selectedDateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedDate = AutoDisposeNotifier<List<DateTime>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
