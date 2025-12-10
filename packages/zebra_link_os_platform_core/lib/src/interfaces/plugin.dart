import 'package:zebra_link_os_platform_core/interfaces.dart';

abstract interface class ZebraLinkOsPluginInterface
    implements
        ZebraPrinterInterface,
        ZebraConnectionInterface,
        ZebraDiscoveryInterface,
        DisposableInterface {}
