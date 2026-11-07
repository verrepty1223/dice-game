project('dice-game', 'vala', version: '0.1.0')

sources = files(
    'src/entrypoint.vala',
    'src/domain/controller.vala',
    'src/domain/game-core.vala',
    'src/domain/dice.vala',
    'src/ui/cli/cli-interface.vala'
    )

deps = [dependency('glib-2.0'), dependency('gobject-2.0')]

executable('dice-game', sources, dependencies: deps)