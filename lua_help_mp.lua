struct PlayerData
{
    LPCSTR GetNickName(); -- NICKNAME of Player
    LPCSTR GetVisual(); -- VISUAL-Path of Player
	LPCSTR WeaponSection(); -- Section of Weapon which holds Player
    LPCSTR DeviceSection(); -- Section of Device which holds Player
    LPCSTR AttachSection(); -- Section of Item which attched to Player due custom animation
    u32 LevelCRC(); -- CRC Of his level
    Fvector GetPosition(); -- Position of Player
    Fvector GetRotation(); -- Rotation of Player
    float GetRoll(); -- Roll of Player (QE QE QE QE)
    u16 GetObjectID(); -- OBJECT ID.. of spawned object
    bool HasItem(LPCSTR Name); -- Condition for quests? Just if necessary. If one of player had this item. Can be usefull in loop.
    bool HasItem(u32 CRC); -- Condition for quests? Just if necessary. If one of player had this item. Can be usefull in loop.
}
class PlayerManager {
    -- GetPlayerData
    PlayerData* GetPlayerData(LPCSTR);
    PlayerData* GetPlayerData(u32 ID);
    PlayerData* GetPlayerDataByNPCID(u16 ID); 
    PlayerData* GetPlayerDataAtIndex(u8 ind);
    -- Player Management
    bool IsItMyPlayer(u16 ID); -- Check is this object our player.
    u32 GetReceivedPlayers(); -- Count joined players. Not connected.
    void ForceResetAnimation(u32 SNET); -- Reset animations. If need it. Hacks for modders.
    void TeleportPlayer(u32 SNET, vector pos); -- Teleport player. (Host action)
    void SyncWeatherWith(u32 SNET, LPCSTR Weather, bool force); -- Sync weather with player. (Host action)
    void SyncTimeWith(u32 TIME); -- Sync time with player. (Host action)
    u32 GetPing(u32 SNET); -- Max ping. The ping by SNET of player.
    u32 GetPingAt(u8 ind); -- Max ping. The ping at array index of players.
    u32 GetMaxPing(); -- Max ping. The ping of high pinged player.
    void AddItem(u32 SNET, LPCSTR Item); -- Add item to inventory. (Not object) Only registers CRC data.
    void RemoveItem(u32 SNET, LPCSTR Item); -- Remove item from inventory. (Not object) Only registered CRC data.
    bool IsVehicleUsed(u16 ID); -- Someone uses this vehicle?
    bool IsVehicleUsed(u32 SNET, u16 ID); -- Just check is this player uses this.
    bool PlayerExist(u32 NETID);
    void ResetData(u32 SNET); -- Clear pointers from data and set default items array.
    void ResetData(PlayerData* pdata); -- Clear pointers from data and set default items array.
    void SpawnItem(u32 SNET, LPCSTR Item); -- Spawn item in player.
    void SpawnItem(PlayerData* pdata, LPCSTR Item); -- Spawn item in player.
    void UpdatePlayerPings(); -- Just update actual ping info.
    void CleanUpPointers(); -- Cleanup pointers from all datas.
    void HasItem(u32 SNET, LPCSTR Item); -- Check is someone had item.
    void HasItem(LPCSTR Item); -- Check is someone had item.
    void SendRewardTo(u32 TO, u32 FROM, u32 count); -- Send money to player. (Host action)
    void SendDamageTo(u32 TO, u32 FROM, SHit* hds); -- Send money to player. (Host action)
    void KickPlayer(u32 SNET); -- Kicks player. (Host action)
    void DespawnPlayer(u32 SNET, bool Erase); -- Despawns player. (Host/client action). If need it.
    void SyncPlayerDatasWith(u32 SNET); -- Send all info portions to players. (Host action) (If need to resync them)
    void SyncInfoPortionsWith(u32 SNET); -- Send info portion to players. (Host action) (If need to force send them)
    void SyncLevelObjectsWith(u32 SNET); -- Send all level objects to players. (Host action) (If need to resync them)
    void PlayerObjectExist(u32 SNET); -- Check if player spawned. IDK maybe someone need it.
}
class MPGameManager {
    void SetFlag(bool BH); -- SET FLAG I WANT BE HOST OR NOT.
    bool GetFlag();-- CHECK FLAG I WANT BE HOST OR NOT.
    void SetGameLoaded(bool st); -- Set Game Loaded flag
    bool GetGameLoaded(); -- Get Game Loaded flag
    void SetFriendFire(bool FF); -- SET FLAG FRIENDLY FIRE.
    bool IsFriendFireEnabled(); -- CHECK FLAG FRIENDLY FIRE.
    void SetTestMyClient(bool TT); -- TEST CLIENT. Unblocks Self join.
    void EnableDebugs(bool c, bool r); -- Debug logs. A few spam looped logs... Param1 = DebugCalls, Param2 = DebugRecvs.
    bool IsStalker(CSE_Abstract* sid); -- Check Is Stalker
    bool IsActor(CSE_Abstract* sid); -- Check Is Actor
    bool IsSmartTerrain(CSE_Abstract* sid); -- Check Is SmartTerrain
    bool IsMonster(CSE_Abstract* sid); -- Check Is Monster
    bool IsGraph(CSE_Abstract* sid); -- Check Is Graph
    bool IsTrader(CSE_Abstract* sid); -- Check Is Trader
    bool IsStashFirstFilled(CSE_Abstract * sid); -- Check Is stash filled. Just like if i first opened or not. (Usefull for client actions) by se_obj
    bool IsStashFirstFilled(u16 sid); -- Check Is stash filled. Just like if i first opened or not. (Usefull for client actions) by id
    bool IsItem(CSE_Abstract* sid); -- Check Is Item
    bool IsInvbox(CSE_Abstract* sid); -- Check Is InvBox
    bool IsBolt(CSE_Abstract* sid); -- Check Is Bolt
    bool IsSquad(CSE_Abstract* sid); -- Check Is Squad
    bool IsOutfit(CSE_Abstract* sid); -- Check Is Outfit
    bool IsHelmet(CSE_Abstract* sid); -- Check Is Helmet
    bool IsPhysicObject(CSE_Abstract* sid); -- Check Is Physic Object
    bool IsAnomalyArtefact(CSE_Abstract* sid); -- Check Is Artefact
    bool IsAmmo(CSE_Abstract* sid); -- Check Is Ammo
    bool IsWeapon(CSE_Abstract* sid); -- Check Is Weapon
    bool IsAnomalyZone(CSE_Abstract* sid); -- Check Is Anomaly Zone
    u16 GetServerIDByLocalID(u16 ii); -- ServerID By LocalID. u16=u16
    u16 GetLocalIDByServerID(u16 ii); -- LocalID By ServerID. u16=u16
    void SetServerIDByLocalID(u16 CLIENTID, u16 HOSTID); -- Sets LocalID=ServerID. Usefull if need to make registers.
    void ShowConnectionError(u8 t); -- Sets connection error message num... Beta
    -- NET STATUS IN/OUT DATA
    SteamNetConnectionRealTimeStatus_t GetStatus(u32 SNETID); -- GET STEAM SOCKETS NETWORK DATA.

    -- Manual things useless
    void RegisterTimeEvent(u32 ACTIO, u32 CLID, u32 DELAY, u16 ITEM = u16(-1), u32 SECONDDELAY_USELESS = 0); -- Only if you understand what are you doing
    void UnregisterTimeEvent(u32 ACTOIT); -- Only if you understand what are you doing

    -- Manual coroutines
    void ManualClientUpdate();
    void ManualServerUpdate();
    void ManualClientUpdateS();
    void ManualProcessEntities();
    void ForceSyncMovement();
    void ForceSyncMyDevice();
    void ForceSyncMyWeapon();
    void ForceSyncMyVisual();

    -- Used for cleanup data. If it someway overflowing...
    void ClearData(bool CleanUP);

    -- Server
    void SetTickRate(u16 Tickrayt);
    void SetMaxPlayers(BYTE PCOUNT);
    void SetServerName(LPCSTR PNAME);

    -- PLAYER
    void SetNickName(LPCSTR PNAME); -- SET'S OUR NICKNAME
    u16 SpawnInNPC(CSE_ALifeDynamicObject* s_id, LPCSTR s_name); -- SPAWNOBJECT IN NPC
    u16 SpawnInNPC(void* obja, LPCSTR s_name); -- SPAWNOBJECT IN NPC

    -- REQUEST
    void OnRequest(); -- Obtain server info and makes game loaded
    bool GetFriendFire(); -- IS FriendFire Enabled
    void OnILoaded(); -- Means level loaded and ready to listen server! (Send playerdata and requests)

    -- PLAYER CALLBACKS
    void OnIUse(CSE_ALifeDynamicObject* obj); -- Called when used item. On other side works only if this player has this item in inventory!!
    void OnIUse(u16 obj); -- Called when used item. On other side works only if this player has this item in inventory!!
    void OnIUsedTorch(bool state); -- Turn on or off torch.
    void OnIUseVehicle(CSE_ALifeDynamicObject* obj, bool Sitdown_OR_Leave); -- (DEVELOPMENT) Just make own the vehicle to avoid multi controll issue. (In engine)
    void OnIUseVehicle(u16 obj, bool Sitdown_OR_Leave); -- (DEVELOPMENT) Just make own the vehicle to avoid multi controll issue. (In engine)
    void OnIInteract(CSE_ALifeDynamicObject* obj, u8 typef); -- On interact call data... Some custom actions with objects. typef is what to do with it. By se_obj
    void OnIInteract(u16 obj, u8 typef); -- On interact call data... Some custom actions with objects. typef is what to do with it. By ID.
    void OnIMovementState(u16 slot, u16 idx, u32 Val); -- Some Animation state. OnIMovementState can be used for custom MotionID
    void OnICustomAnimation(LPCSTR TbIANASHA_ANIM_NAME, LPCSTR APPEAR_ITEM, bool Force, float Delay, LPCSTR SND_NAME); -- Launchs custom animation. With item or not.
    void OnIMovementPosition(Fvector d); -- Just forces send move positinio data
    void OnIMovementRotation(Fvector d, float ln); -- Just forces send move rotation data
    void OnIChangedVisual(LPCSTR d); -- Just if need custom visuals. Like you weared outfit. But wanted another visual or keep it same. (As hacks for overwriting)
    void OnIInfoPortion(LPCSTR D, bool d); -- SEND INFO PORTION TO HOST. Host will resend to all.
    void BlockInfoPortion(LPCSTR ID); -- BLOCK INFO PORTION TO BE SYNCED.
    void OnIChatMSG(LPCSTR D); -- max 4096 chars
    void OnILevelChanging(); -- NOT IMPORTANT, BUT IF NEED TO RECONNECT SYSTEM 1. OnILevelChanging 2. Need Someway to clear zone from old objects 3. OnRequest 4. OnILoaded
    void OnEntityDamage(SHit* se); -- SEND HIT TO ENTITY. (IN ENGINE USED BY DEFAULT. Just if need to make something)
    void OnIGetTask(CGameTask* datat, LPCSTR title_nt, LPCSTR descr_nt, u16 TaskGIVER, u16 Stage, bool newa);
    void OnForcedTaskState(LPCSTR title_nt, LPCSTR HUISOSI_STATE);
    void OnICustomScriptAction(LPCSTR CALLNAME, bool OnlyToServer); -- LIKE ...functor("MYACTION.CALThisBREED", lua_function) -> lua_function()
    void OnIStashOpen(CSE_ALifeDynamicObject* box); -- REQUEST ALIFE ITEM STORAGE DATA FROM HOST BY BOX SE_OBJ.
    void OnIStashOpen(u16 box); -- REQUEST ALIFE ITEM STORAGE DATA FROM HOST BY ID.
    void OnIWantCompanion(CSE_ALifeDynamicObject* obj); -- REQUEST HOST TO OBTAIN COMPANION from obj
    void OnIWantCompanion(u16 obj); -- REQUEST HOST TO OBTAIN COMPANION from id
    void OnINoWantCompanion(CSE_ALifeDynamicObject* obj); -- REQUEST HOST TO LOST COMPANION by seobj
    void OnINoWantCompanion(u16 obj); -- REQUEST HOST TO LOST COMPANION by id
    void OnQuestSpawner(CSE_ALifeDynamicObject* obj); -- REQUEST SPAWN ENTITY ON HOST SIDE
    void RequestEntityDespawn(CSE_Abstract* o); -- REQUEST DESPAWN ENTITY ON HOST SIDE

    -- USELESS THINGS
    void OnIPickup(CSE_ALifeDynamicObject* obj); -- Just if need it. IDK. Why i put it here. (In engine)
    void OnIPickup(u16 obj); -- Just if need it. IDK. Why i put it here. (In engine)
    void OnIDrop(CSE_ALifeDynamicObject* obj); -- Just if need it. IDK. Why i put it here. (In engine)
    void OnIDrop(u16 obj); -- Just if need it. IDK. Why i put it here. (In engine)
    void OnIFire(u8 type); -- Just if need it. IDK. Why i put it here.
    void OnIReload(u8 type); -- Just if need it. IDK. Why i put it here.
    void OnIChangedGun(LPCSTR name); -- Just if need it. IDK. Why i put it here.
    void OnIChangedDevice(LPCSTR name); -- Just if need it. IDK. Why i put it here.

    -- SENDMONEY TO PLAYER
    void OnISendReward(u32 MoneyCount, LPCSTR NICKNAME);
    void OnISendReward(u32 MoneyCount, u32 ID);
    
    -- Server actions / CALLBACKS
    void OnEntityDespawned(CSE_Abstract* obj);
    void OnEntityDespawned(u16 obj);
    void OnEntityDestroyed(CSE_ALifeDynamicObject* obj);
    void OnEntityDestroyed(u16 id);
    void OnEntityDead(CSE_ALifeDynamicObject* id);
    void OnEntityDead(u16 id);
    void OnEntityOnlineOffline(CSE_ALifeDynamicObject* obj, bool Online);
    void OnEntityOnlineOffline(u16 obj, bool Online);
    void OnEntitySpawned(CSE_ALifeDynamicObject* obj);
    void OnEntitySpawnedID(u16 obj);
    void ServerEntitiesUpdate();
    void OnEntityUpdate(CSE_ALifeDynamicObject* OBJ);
    void OnEntityUpdate(u16 obj);
    void OnEntityShoot(u16 ID);
    void OnEntityInteract(CSE_ALifeDynamicObject* obj, u8 typeact);
    void OnEntityInteract(u16 id, u8 typeact);
    void OnEntityVisualChanged(CSE_ALifeDynamicObject* id, LPCSTR visual);
	void OnEntityVisualChangedID(u16 id, LPCSTR visual);
    void RegisterObject(CSE_ALifeDynamicObject* obj);
    void UnregisterObject(CSE_ALifeDynamicObject* obj);
    void OnWeatherChanged(LPCSTR weathe, bool forca);
    void OnWeatherFXChanged(LPCSTR weather);
    void OnTimeChanged();
    void OnCustomSound(LPCSTR Name, Fvector pos, u16 EID);
    void OnCustomSound(LPCSTR Name, Fvector pos, CSE_ALifeDynamicObject* EID);
    void SyncAllPortions();
    void OnEmissionPsy(bool IsPsy, bool Enabled);
    void OnSaveGame();

    -- Server custom packet (NET_Packet)
    void SendToClientCustomPacketFrom(NET_Packet pak, u32 from, u32 to, u32 flags);
	void SendToAllCustomPacketFrom(NET_Packet pak, u32 from, u32 flags);
	void SendToServerCustomPacket(NET_Packet pak, u32 flags);

    -- Client custom packet (NET_Packet)
    void SendToAllCustomPacket(NET_Packet pak, u32 flags);
}
class MClient {
    u32 connectionID(); -- Get u32 atoi ip address...
    void CreateConnection(LPCSTR connectionIP); -- Connect to server.
    void Disconnect(); -- Disconnect from server.
    bool IsConnected(); -- Is Connected to server.
    bool IsSteamInterface(); -- IsSteam init.
    SteamNetConnectionRealTimeStatus_t GetStatus(); -- Connect status IN/OUT E.T.C
}
class MServer {
    u32 get_players_count(); -- Count connected clients
    u32 get_player_by_index(u8 id); -- get player id from clients array by index
    void erase_player_by_id(u32 id); -- erase player id from clients array
    bool is_client_exist(u32 id); -- Is client exist in server clients array
    void OpenListenSocket(u32 PORT); -- CreateServer
    void CloseConnection(u32 connection, LPCSTR reasoun, u32 EMessageID); -- Force disconnect client
    void CloseListenSocket(); -- Close Server
    bool IsSteamInterface(); -- Is Steam Init
    bool IsSteamSocketOpen(); -- Is Server hosted
    SteamNetConnectionRealTimeStatus_t GetStatus(); -- Connect status IN/OUT E.T.C of client by snet.
    SteamNetConnectionRealTimeStatus_t GetStatusAt(u8); -- Connect status IN/OUT E.T.C of client by index.
}
-- Steam Status. Check wiki of project https://github.com/ValveSoftware/GameNetworkingSockets
struct SteamNetConnectionRealTimeStatus_t {
    int Ping;
    int PendingReliable;
    int PendingUnreliable;
    float BytesPerSec;
    int SentUnackedReliable;
    int State;
    float ConnectionQualityLocal;
    float ConnectionQualityRemote;
    float InPacketsPerSec;
    float InBytesPerSec;
    float OutBytesPerSec;
    float OutPacketsPerSec;
    float SendRateBytesPerSecond;
    long QueueTime;
    u32 reserved;
}