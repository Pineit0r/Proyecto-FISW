package proyecto.fisw

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.apache.commons.lang.builder.HashCodeBuilder

@ToString(cache=true, includeNames=true, includePackage=false)
class UserRol_S implements Serializable {

	private static final long serialVersionUID = 1

	User user
	Rol_S rol_S

	UserRol_S(User u, Rol_S r) {
		this()
		user = u
		rol_S = r
	}

	@Override
	boolean equals(other) {
		if (!(other instanceof UserRol_S)) {
			return false
		}

		other.user?.id == user?.id && other.rol_S?.id == rol_S?.id
	}

	@Override
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (user) builder.append(user.id)
		if (rol_S) builder.append(rol_S.id)
		builder.toHashCode()
	}

	static UserRol_S get(long userId, long rol_SId) {
		criteriaFor(userId, rol_SId).get()
	}

	static boolean exists(long userId, long rol_SId) {
		criteriaFor(userId, rol_SId).count()
	}

	private static DetachedCriteria criteriaFor(long userId, long rol_SId) {
		UserRol_S.where {
			user == User.load(userId) &&
			rol_S == Rol_S.load(rol_SId)
		}
	}

	static UserRol_S create(User user, Rol_S rol_S, boolean flush = false) {
		def instance = new UserRol_S(user, rol_S)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(User u, Rol_S r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = UserRol_S.where { user == u && rol_S == r }.deleteAll()

		if (flush) { UserRol_S.withSession { it.flush() } }

		rowCount
	}

	static void removeAll(User u, boolean flush = false) {
		if (u == null) return

		UserRol_S.where { user == u }.deleteAll()

		if (flush) { UserRol_S.withSession { it.flush() } }
	}

	static void removeAll(Rol_S r, boolean flush = false) {
		if (r == null) return

		UserRol_S.where { rol_S == r }.deleteAll()

		if (flush) { UserRol_S.withSession { it.flush() } }
	}

	static constraints = {
		rol_S validator: { Rol_S r, UserRol_S ur ->
			if (ur.user == null || ur.user.id == null) return
			boolean existing = false
			UserRol_S.withNewSession {
				existing = UserRol_S.exists(ur.user.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['user', 'rol_S']
		version false
	}
}
